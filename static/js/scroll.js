$(document).ready(function() {
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 80
    });

    // Page scrolling feature
    $('a.page-scroll').bind('click', function(event) {
        var link = $(this);
        $('html, body').stop().animate({
            scrollTop: $(link.attr('href')).offset().top - 50
        }, 500);
        event.preventDefault();
        $("#navbar").collapse('hide');
    });

    // Si está colapsado el menu
    if (!$("#navbar").is(":visible"))
    {  
        $(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
        $('.btn-logo-home-default').removeClass('btn-logo-home-default').addClass('btn-logo-home-scroll');
    }
    else
    {
        $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
        $('.btn-logo-home-scroll').removeClass('btn-logo-home-scroll').addClass('btn-logo-home-default');
    }

});

var cbpAnimatedHeader = (function() {
    var changeHeaderOn = 200, scrollDebounce = 250;

    function scrollPage() {
      $('.navbar-default').toggleClass('navbar-scroll', scrollY() >= changeHeaderOn);

      $('.btn-logo-home-default').toggleClass('btn-logo-home-scroll', scrollY() >= changeHeaderOn);
    }

    function scrollY() {
      return window.pageYOffset || document.documentElement.scrollTop;
    }

    window.addEventListener('scroll', function() { setTimeout(scrollPage, scrollDebounce); }, false);
})();

// Activate WOW.js plugin for animation on scroll
new WOW().init();
