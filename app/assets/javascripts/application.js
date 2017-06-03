// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* funciones para creacion de topics y comentarios movil*/

$(function(){


    $(document).on('turbolinks:load', function () {
        $("tr[data-link]").click(function() {
            window.location = $(this).data("link")

        });

    });

    $(window).load(function () {
        var fixmeTop = $('.fixme').offset().top;
        $(window).scroll(function() {
            var currentScroll = $(window).scrollTop();
            if (currentScroll + 100 >= fixmeTop) {
                $('.fixme').css({
                    position: 'fixed',
                    top: '100px',
                    right: '12%'
                });
            } else {
                $('.fixme').css({
                	position: 'absolute',
                    top: '400px',
                    right: '12%'
                });
            }
        });
    });

    /* Animacion boton subir */
    $(document).ready(function(){

        $('.go-up').click(function(){
            $('body, html').animate({
                scrollTop: '0px'
            }, 300);
        });

        $(window).scroll(function(){
            if($(this).scrollTop() > 0){
                $('.go-up').slideDown(300);
            } else{
                $('.go-up').slideUp(300);
            }
        });

    });

    /* para utilizar AJAX en links de paginacion */
    $(function(){
       $('.pagination a').attr('data-remote', 'true')
    });
});