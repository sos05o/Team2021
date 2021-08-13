'use strict'
$(function () {
    $(".fas").on("click", function () {
        $(this).toggleClass("icon_disabled");
        $(this).siblings().toggleClass("icon_disabled");
        $(this).parent().parent().toggleClass("tr_main_gray");
        if ($(this).parent().siblings('.td_id').children('.check-chief').prop('checked')) {
            console.log("checked");
            $(this).parent().siblings('.td_id').children('.check-chief').prop('checked', false);
        } else {
            $(this).parent().siblings('.td_id').children('.check-chief').prop('checked', true);
        }
    })
})