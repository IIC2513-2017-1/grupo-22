// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {

	var modalBackground = $(".modal-background.edit-topic");
	var buttonClose = $(".container-edit-topic .close");

	buttonClose.on("click", function(){
		modalBackground.fadeOut(300);
		containerModal.css("transform", "scale(0.1)");
	});
	
});