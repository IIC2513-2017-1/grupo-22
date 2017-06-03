// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).ready(function(){

		var buttonLogin = $(".user-button#login");

		var modalBackground = $(".modal-background.login");

		var buttonClose = $(".close");

		buttonLogin.on("mouseover", function(){
			buttonLogin.css("cursor","pointer");
		});

		buttonLogin.on("click", function(e){		
			modalBackground.fadeIn("slow");
			e.preventDefault();	
		});

		buttonClose.on("click", function(){
			modalBackground.fadeOut("slow");
			$(".field #session_username").val('');
			$(".field #session_password").val('');
		});
	});
});