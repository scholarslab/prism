$ ->
    $("#visualizations span.facet.border").first().removeClass('border')
    all_colors = []
    frequencies = {}
    facets = $("li.vis_facet")
    for facet in facets
        color = $("input.color", facet).val()
        all_colors.push(color)
        frequencies[color] = JSON.parse($("input.freq", facet).val())
    # Clicking on a facet sets the color
    $("li.vis_facet").click ->
        current_color = $("input", this).val()
        $("span.facet.border").removeClass("border")
        $(this).find("span.facet").addClass("border")
        words = d3.selectAll("span.word")
        for color in all_colors
            words.classed(color+"-vis", false)
        words.data(frequencies[current_color])
             .classed(current_color+"-vis", (d) -> (d > 0))
             .transition()
             .style("font-size", (d) -> (15+20*d) + "px" )