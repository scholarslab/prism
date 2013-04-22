# Get the global namespace so that we can make things global
window = (exports ? this)

# This function extracts the colors and frequencies from our input data
window.setup_visualize = ->
    window.all_colors = []
    window.all_facet_nums = []
    window.colormap = {}
    window.frequencies = {}
    facets = $("li.vis_facet")
    for facet in facets
        color = $("input.color", facet).val()
        facet_num = $("input.order", facet).val()
        window.all_colors.push(color)
        window.all_facet_nums.push(facet_num)
        window.frequencies[facet_num] = JSON.parse($("input.freq", facet).val())
    # Clicking on a facet sets the color
    $("li.vis_facet").click ->
        window.select_facet($(this))

# This function selects a facet, gives the box a border, and highlights text
window.select_facet = (facet) ->
    current_color = $("input.color", facet).val()
    current_num = $("input.order", facet).val()
    $("span.facet.border").removeClass("border")
    $(facet).find("span.facet").addClass("border")
    words = d3.selectAll("span.word")
    for color in window.all_colors
        words.classed(color+"-vis", false)
    words.data(window.frequencies[current_num])
         .classed(current_color+"-vis", (d) -> (d > 0))
         .transition()
         .style("font-size", (d) -> (15+20*d) + "px" )


    