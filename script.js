// copy_button.js

document.addEventListener("DOMContentLoaded", function () {
  // Select all <code> blocks that are direct children of <pre> (standard Markdown code blocks)
  document.querySelectorAll("pre > code").forEach(function (codeBlock) {
    const pre = codeBlock.parentNode; // This is the <pre> element

    // 1. Create a new container DIV for this code block
    // This container will wrap the <pre>, the copy button, and the feedback message.
    // It is essential for positioning the button and feedback absolutely within the code block's visual area.
    const container = document.createElement("div");
    container.className = "code-block-container";

    // 2. Create the copy button element
    const button = document.createElement("button");
    button.className = "copy-button";
    button.type = "button"; // Important for buttons not to submit forms
    button.innerText = "Copy";

    // 3. Create the feedback message span element
    const feedbackSpan = document.createElement("span");
    feedbackSpan.className = "feedback-message";

    // 4. Add click event listener to the copy button
    button.addEventListener("click", function () {
      // Use the Clipboard API to write the code block's text content
      navigator.clipboard.writeText(codeBlock.innerText).then(() => {
        // On successful copy, update feedback text and make it visible
        feedbackSpan.innerText = "Copied!";
        feedbackSpan.style.opacity = 1; // Make visible
        // Set a timeout to fade out the feedback message after a short delay
        setTimeout(() => {
          feedbackSpan.style.opacity = 0; // Start fade out
        }, 1500); // Display for 1.5 seconds
      }).catch(err => {
        // Handle potential errors during copy operation (e.g., permissions)
        console.error('Failed to copy text: ', err);
        feedbackSpan.innerText = "Error!";
        feedbackSpan.style.opacity = 1;
        setTimeout(() => {
          feedbackSpan.style.opacity = 0;
        }, 1500);
      });
    });

    // 5. Re-structure the DOM:
    //    a. Insert the new container DIV before the original <pre> element in the DOM
    pre.parentNode.insertBefore(container, pre);
    //    b. Move the original <pre> element *into* the new container
    container.appendChild(pre);
    //    c. Append the copy button and feedback span *into* the new container
    container.appendChild(button);
    container.appendChild(feedbackSpan);
  });
});
