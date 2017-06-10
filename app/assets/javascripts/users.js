// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).on('turbolinks:load', function () {

		var buttonSignUp= $("#sign-up");

		var modalBackground = $(".modal-background.sign-up");

		var containerModal = modalBackground.find(">:first-child");

		var buttonClose = $(".container-sign-up .close");

		buttonSignUp.on("click", function(e){
			modalBackground.fadeIn(300);
			containerModal.css("transform", "scale(1)");
			e.preventDefault();
		});

		buttonClose.on("click", function(){
			modalBackground.fadeOut(300);
			containerModal.css("transform", "scale(0.1)");
		});
	});

	$(document).on('turbolinks:load', function () {
		var modalBackground = $(".modal-background.edit-user");
		var buttonClose = $(".container-edit-user .close");

		buttonClose.on("click", function(){
			modalBackground.fadeOut(300);
			containerModal.css("transform", "scale(0.1)");
		});

	});

});
