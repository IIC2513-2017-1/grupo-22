// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).ready(function(){

		var buttonAddTourney = $(".add-tourney");

		var modalBackground = $(".modal-background.tourney");

		var buttonClose = $(".close");

		buttonAddTourney.on("click", function(e){		
			modalBackground.fadeIn("slow");
			e.preventDefault();	
		});

		buttonClose.on("click", function(){
			modalBackground.fadeOut("slow");
		});
	});
});