# Get the global namespace so that we can make things global
window = (exports ? this)
# max and min font-size for visualization
max_size = 40
min_size = 15

# This function extracts the colors and frequencies from our input data
window.setup_visualize = ->
  window.all_colors = []
  window.all_facet_nums = []
  window.all_facet_names = []
  window.colormap = {}
  window.frequencies = {}
  facets = $("li.vis_facet")

  for facet in facets
    color = $("input.color", facet).val()
    facet_num = $("input.order", facet).val()
    facet_name = facet.textContent
    window.all_colors.push(color)
    window.all_facet_nums.push(facet_num)
    window.all_facet_names.push(facet_name)
    window.frequencies[facet_num] = JSON.parse($("input.freq", facet).val())


  # Clicking on a facet sets the color
  $("li.vis_button").click ->
    window.select_facet($(this))

  $("span.vis_selection").click ->
    window.select_vis($(this))

  window.chart = new google.visualization.PieChart(document.getElementById('chart_div'));

  #default empty chart for page load
  dataArray = [['Facet', 'Highlights'],['No Word Selected',1]]
  chartColors = ["lightgrey"]
  window.drawChart(dataArray,chartColors)




window.select_word = (i,word) ->
  current_word = word.textContent
  current_word = current_word.replace(/[^a-zA-Z0-9]+/g,"")
  chart_title = 'Highlights for "' + current_word + '":'
  $("p.chart_title").text(chart_title)

  $("span.word").removeClass("vis-selected-word")
  $(word).addClass("vis-selected-word")

  dataArray = [['Facet', 'Highlights']]
  totalHighlights = 0
  for facet_num in all_facet_nums
    dataArray.push([window.all_facet_names[facet_num], frequencies[facet_num][i]])
    totalHighlights += frequencies[facet_num][i]

  chartColors = [];
  for facetColor in window.all_colors
    chartColors.push($('.'+facetColor+'-vis').css('color'))

  if totalHighlights==0
    dataArray = [['Facet', 'Highlights'],['No Highlights',1]]
    chartColors = ["lightgrey"]

  window.drawChart(dataArray,chartColors)


# This function selects a facet, gives the box a border, and highlights text
window.select_facet = (facet) ->
  current_color = $("input.color", facet).val()
  console.log(current_color)
  current_num = $("input.order", facet).val()
  $("span.facet.border").removeClass("border")
  $(facet).find("span.facet").addClass("border")
  $("body").attr('class', current_color)

  words = d3.selectAll("span.word")
  for color in window.all_colors
    words.classed(color+"-vis", false)

  if current_color=='winning'
    words.data(window.frequencies[0])
      .transition()
      .style("font-size", (d) -> min_size + "px")

    words = $("span.word")
    words.each( (i,word) ->

      word_freqs = for facet_num in all_facet_nums
        [frequencies[facet_num][i], window.all_colors[facet_num]]

      word_freqs.sort()
      word_freqs.reverse()

      #no highlighting gets grey, ties get black

      if word_freqs[0][0] > word_freqs[1][0]
        winning_color = word_freqs[0][1]
        $(word).toggleClass(winning_color + "-vis", true)
      else if word_freqs[0][0] != 0
        $(word).css('color', 'black')
      else
        $(word).css('color', 'lightgrey')

      #$(word).css('color', 'rgb('+Math.round(f*frequencies['red'][i])+','+Math.round(f*frequencies['green'][i])+','+Math.round(f*frequencies['blue'][i])+')')
    )

  else
    min = Math.min.apply @, window.frequencies[current_num]
    max = Math.max.apply @, window.frequencies[current_num]
    multiplier = if max == 0 then 0 else (max_size-min_size)/(max-min)
    # sets color and font-size by linear interpolation
    words.data(window.frequencies[current_num])
      .style("color", "") #clear color from 'winning' viz
      .classed(current_color+"-vis", (d) -> (d > 0))
      .transition()
      .style("font-size", (d) -> (min_size+(d-min)*multiplier) + "px" )

window.select_vis = (vis) ->
  vis_type = $("input.vis_type", vis).val()
  if vis_type == "font_size"
    window.select_facet($("li.vis_button")[1])

    #remove highlighting for winning facet vis
    $("span.word").each( (i,word) ->
      $(word).unbind('click')
      if $(word).hasClass("vis-selected-word")
        $(word).removeClass("vis-selected-word")
        $(word).addClass("vis-selected-word-hidden")
    )
  else if vis_type == "winning_facet"
    window.select_facet($("li.vis_button")[0])

    #clicking word updates pie chart
    $("span.word").each( (i,word) ->
      $(word).click ->
        window.select_word(i,word)
      if $(word).hasClass("vis-selected-word-hidden")
        $(word).removeClass("vis-selected-word-hidden")
        $(word).addClass("vis-selected-word")
    )

window.drawChart = (dataArray,chartColors) ->
  data = google.visualization.arrayToDataTable(dataArray);
  options = 
    legend:
      'position':'bottom'
    chartArea:
      left   : 0
      top    : 10
      width  : "99%"
      height : "50%"
    colors: chartColors
  window.chart.draw(data, options);
