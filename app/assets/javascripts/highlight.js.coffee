# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/

(exports ? this).setup_highlight = ->
	$("#highlighters span.facet").first().addClass('border')
	# Extracts the color data from every facet from html file
	colormap = {}
	all_facets = []
	all_colors = []
	for facet in $("li.facet")
		facet_num = $('input[name="order"]', facet).val()

		# Ignore eraser function
		all_facets.push facet_num unless facet_num is "delete"
		color = $('input[name="color"]', facet).val()
	
		colormap[facet_num] = color
		all_colors.push color unless color is "delete"
	
	# Creates a hash for each facet (keys are colors, values are word numbers)
	# that stores word numbers to show which numbers are marked for which color
	storage = {}
	for facet_num in all_facets
		storage[facet_num] = {}

	# Regular expression to find a word number (searches element's class attribute for 
	# string "word") and strips first 5 characters ("word_")
	get_word_number = (elt) ->
		re = new RegExp("word_\\d+")
		match = re.exec($(elt).attr("class"))[0]
		parseInt match.substring(5)

	# Marks an element with a color
	mark = (elt, facet_num) ->
		color = colormap[facet_num]
		number = get_word_number(elt)
		# defines eraser functionality (delete class color and remove word number 
		# from storage)
		if facet_num is "delete"
			for color in all_colors
				$(elt).removeClass color
			for facet_num in all_facets
				delete storage[facet_num][number]
		else
			# defines normal marking functionality
			$(elt).addClass color
			storage[facet_num][number] = true
			# take data in storage (hash of word numbers for each color), turn it into a string, 
			# and add it to form (so data will be submitted when "submit" is clicked) 
		for facet_num of storage
			numbers = []
			for number of storage[facet_num]
				numbers.push parseInt(number)
			s = JSON.stringify(numbers)
			# finds hidden input for a given color and sets its value to a string 
			$("#facet#{facet_num}_indices").val s
			
	# This code tracks the marking.  Initially not in marking mode.
	currently_marking = false
	# starts with the first color
	current_facet_num = all_facets[0]
	# CSS selector for spans class=word. When mouse is clicked, start marking mode in
	# the current color
	$("span.word").mousedown((event) ->
		event.preventDefault()
		currently_marking = true
		mark this, current_facet_num
	)
	# Only marks text when the mouse is down
	$("span.word").mouseover ->
		mark this, current_facet_num if currently_marking
	
	# Stop marking when mouse is released
	$("html").mouseup ->
		currently_marking = false
	
	# Clicking on a facet sets the color
	$("#Prismabob").css('cursor', 'url(/assets/highlighter-' + 0 + '.gif),crosshair')

	$("li.facet").click ->
		current_facet_num = $('input[name="order"]', this).val()
		$("#Prismabob").css('cursor', 'url(/assets/highlighter-' + current_facet_num + '.gif),crosshair')
		console.log(current_facet_num);
		$("span.facet.border").removeClass("border")
		$(this).find("span.facet").addClass("border")
