function checkCookies() {
    var text = "";
    if (navigator.cookieEnabled == true) {
        text = "";
    } else {
        text = "Cookies are not enabled. For the best experience with this app, please turn on your browser's cookies.";
    }
    document.getElementById("cookies").innerHTML = text;
}