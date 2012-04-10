# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#jashkenas.github.com/coffee-script/

$ ->
  # Extracts the color data from every facet from html file
  all_colors = []
  for facet in $("li.facet")
    val = $("input", facet).val()
    # Ignore eraser function
    all_colors.push val unless val is "delete"

  # Creates a hash for each facet (keys are colors, values are word numbers)
  # that stores word numbers to show which numbers are marked for which color
  storage = {}
  for color in all_colors
    storage[color] = {}

  # Regular expression to find a word number (searches element's class attribute for 
  # string "word") and strips first 5 characters ("word_")
  get_word_number = (elt) ->
    re = new RegExp("word_\\d+")
    match = re.exec($(elt).attr("class"))[0]
    parseInt match.substring(5)

  # Marks an element with a color
  mark = (elt, color) ->
    number = get_word_number(elt)
    # defines eraser functionality (delete class color and remove word number 
    # from storage)
    if color is "delete"
      for color in all_colors
        $(elt).removeClass color
      for key in storage
        delete storage[key][number]
    else
      # defines normal marking functionality
      $(elt).addClass color
      storage[color][number] = true
    # take data in storage (hash of word numbers for each color), turn it into a string, 
    # and add it to form (so data will be submitted when "submit" is clicked) 
    for color of storage
      numbers = []
      for number of storage[color]
        numbers.push parseInt(number)
      s = JSON.stringify(numbers)
      # finds hidden input for a given color and sets its value to a string 
      $("##{ color }_indices").val s

  # This code tracks the marking.  Initially not in marking mode.
  currently_marking = false
  # starts with the first color
  current_color = all_colors[0]
  # CSS selector for spans class=word. When mouse is clicked, start marking mode in
  # the current color
  $("span.word").mousedown((event) ->
    event.preventDefault()
    currently_marking = true
    mark this, current_color
  )
  # Only marks text when the mouse is down
  $("span.word").mouseover ->
    mark this, current_color if currently_marking

  # Stop marking when mouse is released
  $("html").mouseup ->
    currently_marking = false

  # Clicking on a facet sets the color
  $("li.facet").click ->
    current_color = $("input", this).val()
    $("span.facet.border").removeClass("border")
    $(this).find("span.facet").addClass("border")
$ ->
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
        ("span.facet.border").removeClass("border")
        $(this).find("span.facet").addClass("border")
        d3.selectAll("span.word").data(frequencies[current_color]).transition().style("font-size", (d) -> (20+12*d) + "px" ).style("color", (d) -> if (d > 0) 
        	current_color
        else 
        	"black")
