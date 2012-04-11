function positionMenu() {

    // This gets called on every page, whether the tools are available or not.
    // This checks for that.
    $('#tools').each(function() {
        var tools           = $(this);
        var windowScrollTop = $(window).scrollTop();
        var prismabobTop    = $('#Prismabob').offset().top;
        var menuTop         = tools.offset().top;
        var windowHeight    = $(window).height();
        var menuHeight      = tools.height();
        var footerHeight    = $('footer').height();
        var visibleHeight   = menuHeight + footerHeight + 30;
        var sidebar         = tools;

        // console.log('Visible Height:'+ visibleHeight, 'Window:'+ windowHeight,
        //             '1st cond: ' + (windowScrollTop > menuTop),
        //             '2nd cond: ' + (windowHeight > visibleHeight));

        // If the scroll top of the window is greater than the top of the
        // menu, add class fixed.

        if (windowScrollTop >= menuTop &&
            menuTop > prismabobTop &&
            windowHeight > visibleHeight)  {

            sidebar.addClass('fixed');
        } else {
            sidebar.removeClass('fixed');
        }

        /*
         * console.log('wst', windowScrollTop,
         *             'mt', menuTop, 
         *             'pt', prismabobTop,
         *             'wh', windowHeight,
         *             'mh', menuHeight,
         *             'fh', footerHeight,
         *             'vh', visibleHeight, 
         *             'wst-mt', windowScrollTop - menuTop,
         *             'wh-vh', windowHeight - visibleHeight,
         *             '.fixed?', sidebar.hasClass('fixed')
         *            );
         */
    });

}
$(window).resize(positionMenu);
$(window).scroll(positionMenu);
$(window).load(positionMenu);
