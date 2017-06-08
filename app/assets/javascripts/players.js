// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).on('turbolinks:load', function () {

		var buttonAddPlayer = $(".add-player");

		var modalBackground = $(".modal-background.player");

		var containerModal = modalBackground.find(">:first-child");

		var buttonClose = $(".container-playerform .close");

		buttonAddPlayer.on("click", function(e){		
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
		var modalBackground = $(".modal-background.edit-player");
		var buttonClose = $(".container-edit-player .close");

		buttonClose.on("click", function(){
			modalBackground.fadeOut(300);
			containerModal.css("transform", "scale(0.1)");
		});

	});
});