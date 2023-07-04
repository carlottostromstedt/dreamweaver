document.addEventListener('mousemove', function(event) {
    console.log("mouse move");
    var windowWidth = window.innerWidth;
    var windowHeight = window.innerHeight;

    var mouseXpercentage = Math.round((event.pageX  / windowWidth) * 100);
    var mouseYpercentage = Math.round(((event.pageY - 20)/ windowHeight) * 100);

    var radialGradient = document.querySelector('.radial-gradient');
    radialGradient.style.background = 'radial-gradient(at ' + mouseXpercentage + '% ' + mouseYpercentage + '%, #3498db, #2D59FA)';
});
