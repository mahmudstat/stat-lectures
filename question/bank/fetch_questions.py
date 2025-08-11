import pandas as pd
import os

def generate_latex_exam(csv_file_path, output_latex_file):
    """
    Reads question data from a CSV file and generates a LaTeX (.tex) document.

    Args:
        csv_file_path (str): Path to the input CSV file.
        output_latex_file (str): Path for the generated output LaTeX file.
    """
    try:
        # Read the CSV file into a pandas DataFrame
        # Ensure correct column names: 'sl', 'question', 'type', 'noq', 'field', 'chapter', 'topic', 'qcat'
        df = pd.read_csv(csv_file_path)
    except FileNotFoundError:
        print(f"Error: CSV file not found at '{csv_file_path}'")
        return
    except KeyError as e:
        print(f"Error: Missing expected column in CSV: {e}. Please check your CSV headers.")
        return

    # --- LaTeX Preamble ---
    # This includes all the necessary packages and custom commands from your original LaTeX file.
    latex_content = r"""\documentclass[12pt]{exam}
\usepackage{amsmath,amsthm,amsfonts,amssymb,dsfont} % Changed dsmath to dsfont for broader compatibility
\usepackage{float}
\usepackage{ifthen}
\usepackage{array}
\usepackage{geometry}
\geometry{
legalpaper, total={177.8mm, 290mm},left=10mm, right=10mm,
top=7mm, bottom=10mm,
}
\usepackage{enumerate}% http://ctan.org/pkg/enumerate
\usepackage{multicol} %as questions will be in a single column
\usepackage{hhline}
\usepackage[table]{xcolor}

% Accumulate the answers. Unmodified from Phil Hirschorn's answer
% https://tex.stackexchange.com/questions/15350/showing-solutions-of-the-questions-separately/15353
\newbox\allanswers
\setbox\allanswers=\vbox{}

\newenvironment{answer}
{%
  \global\setbox\allanswers=\vbox\bgroup
  \unvbox\allanswers
}%
{%
  \bigbreak
  \egroup
}

\newcommand{\showallanswers}{\par\unvbox\allanswers}
% End Phil's answer


% Is there a better way?
\newcommand*{\getanswer}[5]{%
  \ifthenelse{\equal{#5}{a}}
  {\begin{answer}\thequestion. (a)~#1\end{answer}}
  {\ifthenelse{\equal{#5}{b}}
    {\begin{answer}\thequestion. (b)~#2\end{answer}}
    {\ifthenelse{\equal{#5}{c}}
      {\begin{answer}\thequestion. (c)~#3\end{answer}}
      {\ifthenelse{\equal{#5}{d}}
        {\begin{answer}\thequestion. (d)~#4\end{answer}}
        {\begin{answer}\textbf{\thequestion. (#5)~Invalid answer choice.}\end{answer}}}}}
}

\setlength\parindent{0pt}
%usage \choice{ }{ }{ }{ }
%(A)(B)(C)(D)
\newcommand{\fourch}[5]{
  \par
  \begin{tabular}{*{4}{@{}p{0.23\textwidth}}}
    (a)~#1 & (b)~#2 & (c)~#3 & (d)~#4
  \end{tabular}
  \getanswer{#1}{#2}{#3}{#4}{#5}
}

%(A)(B)
%(C)(D)
\newcommand{\twoch}[5]{
  \par
  \begin{tabular}{*{2}{@{}p{0.46\textwidth}}}
    (a)~#1 & (b)~#2
  \end{tabular}
  \par
  \begin{tabular}{*{2}{@{}p{0.46\textwidth}}}
    (c)~#3 & (d)~#4
  \end{tabular}
  \getanswer{#1}{#2}{#3}{#4}{#5}
}

%(A)
%(B)
%(C)
%(D)
\newcommand{\onech}[5]{
  \par
  (a)~#1 \par (b)~#2 \par (c)~#3 \par (d)~#4
  \getanswer{#1}{#2}{#3}{#4}{#5}
}

\newlength\widthcha
\newlength\widthchb
\newlength\widthchc
\newlength\widthchd
\newlength\widthch
\newlength\tabmaxwidth

\setlength\tabmaxwidth{0.96\textwidth}
\newlength\fourthtabwidth
\setlength\fourthtabwidth{0.25\textwidth}
\newlength\halftabwidth
\setlength\halftabwidth{0.5\textwidth}

\newcommand{\choice}[5]{%
\settowidth\widthcha{AM.#1}\setlength{\widthch}{\widthcha}%
\settowidth\widthchb{BM.#2}%
\ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
  \settowidth\widthchb{CM.#3}%
\ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%
  \settowidth\widthchb{DM.#4}%
\ifdim\widthch<\widthchb\relax\setlength{\widthch}{\widthchb}\fi%

\ifdim\widthch>\halftabwidth
  \onech{#1}{#2}{#3}{#4}{#5}
\else\ifdim\widthch<\halftabwidth
\ifdim\widthch>\fourthtabwidth
  \twoch{#1}{#2}{#3}{#4}{#5}
\else
  \fourch{#1}{#2}{#3}{#4}{#5}
\fi\fi\fi}
"""
    # --- Document Start and Header (from your previous prompt) ---
    latex_content += r"""
\begin{document}

\begin{center}
\textbf{\Huge Statistics Question Bank}
\end{center}
\hrule
\vspace{1cm} % Add some space after the header

\tableofcontents % Automatically generates the table of contents

\newpage % Start the questions on a new page after the TOC


"""

    # --- Initialize variables to track current sectioning ---
    current_field = None
    current_chapter = None
    current_topic = None
    current_qcat = None

    # Flag to indicate if questions environment is currently open
    questions_env_open = False
    # multicolumn_env_open is no longer needed as we're not using multicolumns for questions
    # multicolumn_env_open = False

    # --- Iterate through each row of the DataFrame and build LaTeX content ---
    for index, row in df.iterrows():
        # Clean and title-case the section names for better presentation
        field = str(row['field']).replace('_', ' ').title()
        chapter = str(row['chapter']).replace('_', ' ').title()
        topic = str(row['topic']).replace('_', ' ').title()
        qcat = str(row['qcat']).replace('_', ' ').title()

        # Check for field change (Part level)
        if field != current_field:
            # If we've already opened environments, close them before starting a new part
            if questions_env_open:
                latex_content += r"\end{questions}"
                questions_env_open = False
            # Removed multicolumn_env_open check and closure here

            # Start a new part
            latex_content += f"\n\\part{{{field}}}"

            # Open questions environment for the new part (no multicolumn)
            latex_content += r"\begin{questions}"
            questions_env_open = True

            current_field = field
            current_chapter = None # Reset lower-level section tracking
            current_topic = None
            current_qcat = None

        # Check for chapter change (Section level)
        if chapter != current_chapter:
            latex_content += f"\n\\section{{{chapter}}}"
            current_chapter = chapter
            current_topic = None # Reset lower-level section tracking
            current_qcat = None

        # Check for topic change (Subsection level)
        if topic != current_topic:
            latex_content += f"\n\\subsection{{{topic}}}"
            current_topic = topic
            current_qcat = None

        # Check for qcat change (Subsubsection level)
        if qcat != current_qcat:
            latex_content += f"\n\\subsubsection{{{qcat}}}"
            current_qcat = qcat

        # Add the question content directly from the 'question' column.
        # It's assumed this column already contains the \question and \choice commands.
        latex_content += f"\n{row['question']}"

    # --- End the questions environment at the very end of the document ---
    if questions_env_open:
        latex_content += r"\end{questions}"
    # Removed multicolumn_env_open check and closure here

    # --- LaTeX Postamble ---
    # This includes the motivational quote and author from your previous LaTeX file.
    latex_content += r"""
\vspace{.3cm}

\begin{center}

“The only thing that’s certain is uncertainty.” --- John Allen Paulos

  --- Abdullah Al Mahmud ---
\end{center}

\pagebreak
\bigskip

\begin{multicols}{3}
[
Answer Key
]
\showallanswers % Phil Hirschorn
\end{multicols}

\end{document}
"""

    # --- Write the generated LaTeX content to a .tex file ---
    try:
        with open(output_latex_file, 'w', encoding='utf-8') as f:
            f.write(latex_content)
        print(f"LaTeX file '{output_latex_file}' generated successfully. Now compile it with pdflatex!")
    except IOError as e:
        print(f"Error: Could not write to file '{output_latex_file}': {e}")

# --- Example Usage (replace with your actual CSV link and desired output file) ---
if __name__ == "__main__":
    # Your actual Google Sheets CSV link
    google_sheets_csv_url = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR5ALweTpuyBVmyX3OUiY4GdJE6Afm1p8danJpQHSHNdu2RkIS4AJwPfcbWLnKYSIVcs9MMQHIePABJ/pub?gid=0&single=true&output=csv'

    # Call the function with your CSV file and desired output .tex file name
    generate_latex_exam(google_sheets_csv_url, 'all_questions.tex')
