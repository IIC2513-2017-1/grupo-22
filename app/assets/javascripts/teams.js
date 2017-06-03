// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

	$(document).ready(function(){

		var buttonAddTeam = $(".add-team");

		var modalBackground = $(".modal-background.team");

		var buttonClose = $(".close");

		buttonAddTeam.on("click", function(e){		
			modalBackground.fadeIn("slow");
			e.preventDefault();	
		});

		buttonClose.on("click", function(){
			modalBackground.fadeOut("slow");
		});
	});
});