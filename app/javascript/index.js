const nextButton = document.getElementById("next-button");
const storyText = document.getElementById("story-text");
const mainPicture = document.getElementById("test");
const mainAudio = document.getElementById("audio")
const audioPlayer = document.getElementById("audio-player")
const lineText = document.getElementsByClassName("line-text");
const pictureLinks = document.getElementsByClassName("picture-links");
const audioLinks = document.getElementsByClassName("audio-links")

let x = 1;
nextButton.addEventListener('click', function() {
storyText.textContent = lineText[x].textContent;
mainPicture.src = pictureLinks[x].textContent;
mainAudio.src = audioLinks[x].textContent;
audioPlayer.load();
audioPlayer.play();
x++;
});
