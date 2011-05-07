$(document).ready(function () {
    menuHidden = $.cookie('menuHidden') == "1" ? true : false;
    $('.topmenu').prepend('<div id="menuToggle" class="' + (menuHidden ? 'show' : 'hide') + '"></div>');
    $('#menuToggle').click(function () {
        $('.header').removeClass('hidden');
        if ($('.header').is(':visible')) {
            $(this).removeClass('hide').addClass('show');
            $('.header').slideUp();
            $.cookie('menuHidden', 1);
        }
        else {
            $(this).removeClass('show').addClass('hide');
            $('.header').slideDown();
            $.cookie('menuHidden', 0);
        };
    });
});
