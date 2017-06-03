// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).ready(function(){

		var buttonSignUp= $("#sign-up");

		var modalBackground = $(".modal-background.sign-up");

		var buttonClose = $(".close");

		buttonSignUp.on("click", function(e){		
			modalBackground.fadeIn("slow");
			e.preventDefault();	
		});

		buttonClose.on("click", function(){
			modalBackground.fadeOut("slow");
		});
	});
});