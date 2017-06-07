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

    window.setInterval(notificaciones, 50);

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

    $(document).ready(function(){

        var noticia =$("#noticia");
        var alerta =$("#alerta");
        var closeNoticia = $("#noticia .close");
        var closeAlerta = $("#alerta .close");
        var notificationNoticia = $("#noticia .notification");
        var notificationAlerta = $("#alerta .notification");

        closeNoticia.on("click", function(){
            noticia.fadeOut(400); 
            notificationNoticia.html('');     
        });
    
        closeAlerta.on("click", function(){
            alerta.fadeOut(400);
            notificationAlerta.html('');
        });
    });

    function notificaciones(){

       var noticia = $("#noticia");
       var alerta = $("#alerta");

       var notificationNoticia = $("#noticia .notification");
       var notificationAlerta = $("#alerta .notification");

       if($.trim(notificationNoticia.html())=='') {
        noticia.css("visibility", "hidden");
       }
       else{
        noticia.css("visibility", "visible");
        alerta.css("visibility", "hidden");
        noticia.fadeIn(400);
       }

       if($.trim(notificationAlerta.html())=='') {
        alerta.css("visibility", "hidden");
       }
       else{
        alerta.css("visibility", "visible");
        noticia.css("visibility", "hidden")
        alerta.fadeIn(400);
       }
    };

    /* para utilizar AJAX en links de paginacion */
    $(function(){
       $('.pagination a').attr('data-remote', 'true')
    });

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