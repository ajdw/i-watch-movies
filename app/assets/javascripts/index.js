// Toggle between fa-eye and fa-eye-slash once you click #seen
$(function() {
    $("i").click(function() {
        $(this).toggleClass("fa-eye fa-eye-slash");
    });
});