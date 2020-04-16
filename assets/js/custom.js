$(document).ready(function() {
    //return;
    $("#nav")
        .find("li")
        .not("li.nav-active")
        .hide();
    $("li.nav-active")
        .last(0)
        .find("li")
        .show();
    $("li.nav-active")
        .parents("li")
        .show();
});
