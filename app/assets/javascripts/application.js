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

$(document).on('turbolinks:load', function () {
    $("tr[data-link]").click(function() {
        window.location = $(this).data("link")

    });
});

$(function(){

    var inotification = window.setInterval(notificaciones, 20);
    jQuery.exists = function(selector) {return ($(selector).length > 0);}

    $(document).on('turbolinks:load', function (){
        if ($.exists($('.ventana-movil'))) {
            var fixmeTop = $('.ventana-movil').offset().top;
            $(window).scroll(function() {
                var currentScroll = $(window).scrollTop();
                if (currentScroll + 100 >= fixmeTop) {
                    $('.ventana-movil').css({
                        position: 'fixed',
                        top: '100px',
                    });
                } else {
                    $('.ventana-movil').css({
                        position: 'absolute',
                        top: '470px',
                    });
                }
            });
        };
    });
    

    /* Animacion boton subir */
   var up = function(){

        $('.go-up').on("click",function(){
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

    };

    $(document).ready(up);
    $(document).on('turbolinks:load', up);

    var ready = function(){
        var noticia =$("#noticia");
        var alerta =$("#alerta");
        var mensaje =$("#mensaje");
        var closeNoticia = $("#noticia .close");
        var closeAlerta = $("#alerta .close");
        var closeMensaje = $("#mensaje .close");
        var notificationNoticia = $("#noticia .notification");
        var notificationAlerta = $("#alerta .notification");
        var notificationMensaje = $("#mensaje .notification");

        closeNoticia.on("click", function(){
            noticia.css("display", "none");
            notificationNoticia.html('');                 
        });
    
        closeAlerta.on("click", function(){
            alerta.css("display", "none");
            notificationAlerta.html('');
        });

        closeMensaje.on("click", function(){
            notificationMensaje.html('');
            mensaje.css("display", "none");
        });
    };

    $(document).ready(ready);
    $(document).on('turbolinks:load', ready);

    function notificaciones(){

       var noticia = $("#noticia");
       var alerta = $("#alerta");
       var mensaje =$("#mensaje");

       var notificationNoticia = $("#noticia .notification");
       var notificationAlerta = $("#alerta .notification");
       var notificationMensaje = $("#mensaje .notification");

       if($.trim(notificationNoticia.html())!='') {
        alerta.css("display", "none");
        mensaje.css("display", "none");
        noticia.fadeIn(500);
       }
       else if($.trim(notificationAlerta.html())!=''){
        noticia.css("display", "none");
        mensaje.css("display", "none");
        alerta.fadeIn(500);
       }
       else if($.trim(notificationMensaje.html())!=''){
        alerta.css("display", "none");
        noticia.css("display", "none");
        mensaje.fadeIn(500);
       }
    };

    $(document).on('turbolinks:load', function (){
        var buttontoken = $(".button-token");
        var token = $("#token");

        buttontoken.on('click', function(){
            if($.trim(buttontoken.html())=='Show Token'){
                token.css("opacity", "1");
                buttontoken.html("Hide Token")
            } 
            else {
                token.css("opacity", "0");
                buttontoken.html("Show Token")
            }
        });
    });


     /*$(document).on('turbolinks:load', function () {
        $("#new_user").on('ajax:success', function (e, data) {
            var parsed = JSON.parse(data);

            alert(parsed.status);

        }).on('ajax:error', function (e, data) {
            var parsed = JSON.parse(data);

            alert(parsed.status);
        });

     });*/


    /* Open edit forms 
    
    $(document).on('turbolinks:load', function () {     

        var buttonEdit = $(".edit-match-form");

        buttonEdit.on("click", function(e){
           var id = $(this).attr('id');
           var tourney_id = $(this).attr('tourney');

           $.ajax( {
            type: 'GET',
            url: $(this).attr('data-url'), 
            dataType: 'script',
            data: { 
            "id": id, 
            "tourney_id": tourney_id, 
            }
           });

        });

    });*/

});