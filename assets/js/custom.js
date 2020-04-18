$(document).ready(function() {
    //    return;
    $("div.nav-paths")
        .find("li")
        .not("li.nav-active")
        .hide();
    $("li.nav-active")
        .parents("li")
        .show();
});
