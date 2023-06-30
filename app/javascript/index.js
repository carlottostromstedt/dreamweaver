const nextButton = document.getElementById("next-button");
const storyText = document.getElementById("story-text");
const mainPicture = document.getElementById("test");
const lineText = document.getElementsByClassName("line-text");
const pictureLinks = document.getElementsByClassName("picture-links");

let x = 1;
nextButton.addEventListener('click', function() {
storyText.textContent = lineText[x].textContent;
mainPicture.src = pictureLinks[x].textContent;
x++;
});
