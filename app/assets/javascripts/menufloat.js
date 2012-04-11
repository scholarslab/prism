function positionMenu() {

    // This gets called on every page, whether the tools are available or not.
    // This checks for that.
    $('#tools').each(function() {
        var tools           = $(this);
        var windowScrollTop = $(window).scrollTop();
        var menuTop         = tools.offset().top;
        var windowHeight    = $(window).height();
        var menuHeight      = tools.height();
        var footerHeight    = $('footer').height();
        var visibleHeight   = menuHeight + footerHeight + 50;

        // console.log('Visible Height:'+ visibleHeight, 'Window:'+ windowHeight,
        //             '1st cond: ' + (windowScrollTop > menuTop),
        //             '2nd cond: ' + (windowHeight > visibleHeight));

        // If the scroll top of the window is greater than the top of the
        // menu, add class fixed.

        if (windowScrollTop > menuTop && windowHeight > visibleHeight)  {
            $('#sidebar').addClass('fixed');
        } else {
            $('#sidebar').removeClass('fixed');
        }
    });

}
$(window).resize(positionMenu);
$(window).scroll(positionMenu);
$(window).load(positionMenu);
