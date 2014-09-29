# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$("#all_events").on "click", ->
		if $(".user_event").length == 0
			$("#events_count").text("No events for this day")
		for event in $(".not_owner")
			$(event).removeClass("hidden")

	$("#my_events").on "click", ->
		if $(".owner").length == 0
			$("#events_count").text("You have not events for this day")
		for event in $(".not_owner")
			$(event).addClass("hidden")

	$(".btn-group > .btn").on "click", ->
		$(".btn-group > .btn").removeClass("active")
		$(this).addClass("active")

	$("#all_events").trigger('click')
