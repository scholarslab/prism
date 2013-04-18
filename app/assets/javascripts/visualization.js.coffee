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

		r = frequencies['red'][i]
		g = frequencies['green'][i]
		b = frequencies['blue'][i]

		$(word).mouseenter( () ->
			for color in all_colors
				#console.log(color, frequencies[color][i])
				$("span.red-percent").text(Math.round(r*100) + "%")
				$("span.green-percent").text(Math.round(g*100) + "%")
				$("span.blue-percent").text(Math.round(b*100) + "%")
		)
		f=150

		word_freqs = [['red',r],['green',g],['blue',b]];
		word_freqs.sort (a,b) ->
			return ((a[1] < b[1]) ? -1 : ((a[1] > b[1]) ? 1 : 0));

		#no highlighting gets grey, ties get pink
		#winning_color = ((a[0][1] > a[1][1]) ? a[0][0] : ((a[0][1] == 0) ? "grey" : "pink"))
		#winning_color = ((word_freqs[0][1] > word_freqs[1][1]) ? word_freqs[0][0] : "pink")

		winning_color = "lightgrey"
		if word_freqs[0][1] > word_freqs[1][1]
			winning_color = word_freqs[0][0]
		else if word_freqs[0][1] != 0
			winning_color = "orange"


		$(word).css('color', winning_color)
		
		#$(word).css('color', 'rgb('+Math.round(f*frequencies['red'][i])+','+Math.round(f*frequencies['green'][i])+','+Math.round(f*frequencies['blue'][i])+')')
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
		#words.on('click', (d) -> alert(current_color + ": " + d)) 
