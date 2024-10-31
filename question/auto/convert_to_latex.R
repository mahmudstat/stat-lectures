get_first_values <- function(df, row_num) {
  # Check if the data frame has at least four columns
  if (ncol(df) < 4) {
    stop("The data frame must have at least four columns.")
  }
  
  # Check if the specified row number is valid
  if (row_num > nrow(df) || row_num < 1) {
    stop("Invalid row number. Please provide a valid row number.")
  }
  
  # Extract the first values of the first four columns from the specified row
  first_values <- c(df[row_num, 1], df[row_num, 2], df[row_num, 3], df[row_num, 4])
  
  # Return the vector of first values
  return(first_values)
}

get_first_values(bank, 2)

# Function to convert to latex

convert_to_latex <- function(question, options, correct_answer) {
  # Map the correct answer to its corresponding letter (a, b, c, d)
  correct_index <- which(options == correct_answer) - 1  # zero-based index
  correct_letter <- letters[correct_index + 1]  # letters[1] is 'a', letters[2] is 'b', etc.
  
  # Format the question in LaTeX
  latex_question <- sprintf("\\question \\textbf{%s}\n", question)
  latex_choices <- sprintf("\\choice{%s}{%s}{%s}{%s}{%s}\n", 
                           options[1], options[2], options[3], options[4], correct_letter)
  
  # Combine and return the formatted LaTeX string
  return(paste0(latex_question, latex_choices))
}

# Example usage
question <- "If a coin is tossed thrice, what is the probability of getting at least one head?"
options <- c("$$ \\frac{1}{8} $$", "$$ \\frac{1}{4} $$", "$$ \\frac{3}{8} $$", "$$ \\frac{7}{8} $$")
correct_answer <- "$$ \\frac{7}{8} $$"

# Call the function
latex_output <- convert_to_latex(question, options, correct_answer)
cat(latex_output)

question_no = 2

latex_output_csv <- convert_to_latex(question = bank$Question[question_no],
                                     options = get_first_values(bank, question_no),
                                     correct_answer = bank$Answer[question_no])

latex_output_all <- c()
for (i in 1:length(bank$Question)){
  latex_output_all[i] <- convert_to_latex(question = bank$Question[i],
                                       options = get_first_values(bank, i),
                                       correct_answer = bank$Answer[i])
}
