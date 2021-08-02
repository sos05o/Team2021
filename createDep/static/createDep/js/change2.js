$(function() {
    $(".fas").on("click", function() {
        $(".fa-lock-open").toggleClass("icon_disabled");
        $(".fa-lock").toggleClass("icon_disabled");
        $(this).parent().parent().toggleClass("tr_main_gray");
    })
})