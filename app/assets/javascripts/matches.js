// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).on('turbolinks:load', function () {

		var modalBackground = $(".modal-background.edit-match");

		var containerModal = modalBackground.find(">:first-child");

		var buttonClose = $(".container-edit-match .close");

		buttonClose.on("click", function(){
			modalBackground.fadeOut(300);
			containerModal.css("transform", "scale(0.1)");
		});
	});
});