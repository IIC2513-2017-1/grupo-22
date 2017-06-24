// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).on('turbolinks:load', function () {

		var buttonAddTourney = $(".add-tourney");

		var modalBackground = $(".modal-background.tourney");

		var containerModal = modalBackground.find(">:first-child");

		var buttonClose = $(".container-tourneyform .close");

		buttonAddTourney.on("click", function(e){		
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
		var modalBackground = $(".modal-background.edit-tourney");
		var buttonClose = $(".container-edit-tourney .close");

		buttonClose.on("click", function(){
			modalBackground.fadeOut(300);
			containerModal.css("transform", "scale(0.1)");
		});
	});
});

