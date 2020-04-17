$(document).ready(function() {
    //    return;
    $("#nav")
        .find("li")
        .not("li.nav-active")
        .hide();
    $("li.nav-active")
        .parents("li")
        .show();
});
