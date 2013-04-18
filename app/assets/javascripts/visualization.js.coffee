# Get the global namespace so that we can make things global
window = (exports ? this)

# This function extracts the colors and frequencies from our input data
window.setup_visualize = ->
	window.all_colors = []
	window.frequencies = {}
	facets = $("li.vis_facet")
	for facet in facets
		color = $("input.color", facet).val()
		window.all_colors.push(color)
		window.frequencies[color] = JSON.parse($("input.freq", facet).val())
	# Clicking on a facet sets the color
	$("li.vis_facet").click ->
		window.select_facet($(this))

	words = $("span.word")
	words.each( (i,word) ->
		$(word).mouseenter( () ->
			for color in all_colors
				#console.log(color, frequencies[color][i])
				$("span.red-percent").text(frequencies['red'][i]*100 + "%")
				$("span.green-percent").text(frequencies['green'][i]*100 + "%")
				$("span.blue-percent").text(frequencies['blue'][i]*100 + "%")
		)
		f=150
		$(word).css('color', 'rgb('+f*frequencies['red'][i]+','+f*frequencies['green'][i]+','+f*frequencies['blue'][i]+')')
	)

# This function selects a facet, gives the box a border, and highlights text
window.select_facet = (facet) ->
	current_color = $("input", facet).val()
	$("span.facet.border").removeClass("border")
	$(facet).find("span.facet").addClass("border")
	words = d3.selectAll("span.word")
	for color in window.all_colors
		words.classed(color+"-vis", false)
		words.data(window.frequencies[current_color])
		#words.classed(current_color+"-vis", (d) -> (d > 0))
		words.transition()
		#words.style("font-size", (d) -> (10+20*d) + "px" )
		words.on('click', (d) -> alert(current_color + ": " + d)) 
