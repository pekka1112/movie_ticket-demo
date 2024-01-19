// var btnContainer = document.getElementsByClassName("container");
// var btnContainer = document.getElementsByClassName("collapse navbar-collapse");
var btnContainer = document.getElementsByClassName("collapse navbar-collapse");
var btnContainer2 = btnContainer.getElementsByClassName("navbar-nav ml-auto");
// Get all buttons with class="btn" inside the container
var btns = btnContainer2.getElementsByClassName("nav-item");

// Loop through the buttons and add the active class to the current/clicked button
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function() {
        var current = document.getElementsByClassName("active");

        // If there's no active class
        if (current.length > 0) {
            current[0].className = current[0].className.replace(" active", "");
        }

        // Add the active class to the current/clicked button
        this.className += " active";
    });
}