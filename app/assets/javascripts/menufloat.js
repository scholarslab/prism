function positionMenu() {

    windowScrollTop = $(window).scrollTop();
    menuTop = $('#sidebar').offset().top;
    
    windowHeight = $(window).height();
    menuHeight = $('#sidebar').outerHeight();
    // If the scroll top of the window is greater than the top of the
    // menu, add class fixed.
    if (windowScrollTop > menuTop && windowHeight > menuHeight) {
        $('#sidebar > div').addClass('fixed');
    } else {
        $('#sidebar > div').removeClass('fixed');
    }
}
$(window).resize(positionMenu);
$(window).scroll(positionMenu);
$(window).load(positionMenu);
