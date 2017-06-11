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

    window.setInterval(notificaciones, 20);

    $(document).on('turbolinks:load', function () {
        $("tr[data-link]").click(function() {
            window.location = $(this).data("link")

        });

    });

    $(document).on('turbolinks:load', function (){
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
                    top: '415px',
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

    $(document).on('turbolinks:load', function () {

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
            notificationNoticia.html('');
            noticia.fadeOut(400);      
        });
    
        closeAlerta.on("click", function(){
            notificationAlerta.html('');
            alerta.fadeOut(400);
        });

        closeMensaje.on("click", function(){
            mensaje.fadeOut(400);
            notificationMensaje.html('');
        });
    });


    function notificaciones(){

       var noticia = $("#noticia");
       var alerta = $("#alerta");
       var mensaje =$("#mensaje");

       var notificationNoticia = $("#noticia .notification");
       var notificationAlerta = $("#alerta .notification");
       var notificationMensaje = $("#mensaje .notification");

       if($.trim(notificationNoticia.html())!='') {
        noticia.css("visibility", "visible");
        alerta.css("visibility", "hidden");
        mensaje.css("visibility", "hidden");
        noticia.fadeIn(400);
       }
       else if($.trim(notificationAlerta.html())!=''){
        alerta.css("visibility", "visible");
        noticia.css("visibility", "hidden");
        mensaje.css("visibility", "hidden");
        alerta.fadeIn(400);
       }
       else if($.trim(notificationMensaje.html())!=''){
        alerta.css("visibility", "hidden");
        noticia.css("visibility", "hidden");
        mensaje.css("visibility", "visible");
        mensaje.fadeIn(400);
       }
    };


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