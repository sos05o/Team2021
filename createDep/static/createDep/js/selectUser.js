'use strict'
$(function() {
    $(".form-check-input").on("click", function() {
        $(this).parent().parent().toggleClass("tr_main_gray");
    })

})