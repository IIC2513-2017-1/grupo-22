// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).on('turbolinks:load', function () {

		var buttonLogin = $(".user-button#login");

		var modalBackground = $(".modal-background.login");

		var containerModal = modalBackground.find(">:first-child");

		var buttonClose = $(".close");

		buttonLogin.on("mouseover", function(){
			buttonLogin.css("cursor","pointer");
		});

		buttonLogin.on("click", function(e){		
			modalBackground.fadeIn(300);
			containerModal.css("transform", "scale(1)");
			e.preventDefault();	
		});

		buttonClose.on("click", function(){
			modalBackground.fadeOut(300);
			containerModal.css("transform", "scale(0.7)");
			$(".field #session_username").val('');
			$(".field #session_password").val('');
		});
	});
});