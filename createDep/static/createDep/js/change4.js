'use strict'
$(function() {
    $(".fas").on("click", function() {
        $(this).toggleClass("icon_disabled");
        $(this).siblings().toggleClass("icon_disabled");
        $(this).parent().parent().toggleClass("tr_main_gray");
    })
})