(function() {
  var window;

  window = typeof exports !== "undefined" && exports !== null ? exports : this;

  window.setup_visualize = function() {
    var color, facet, facets, _i, _len;
    window.all_colors = [];
    window.frequencies = {};
    facets = $("li.vis_facet");
    for (_i = 0, _len = facets.length; _i < _len; _i++) {
      facet = facets[_i];
      color = $("input.color", facet).val();
      window.all_colors.push(color);
      window.frequencies[color] = JSON.parse($("input.freq", facet).val());
    }
    return $("li.vis_facet").click(function() {
      return window.select_facet($(this));
    });
  };

  window.select_facet = function(facet) {
    var color, current_color, words, _i, _len, _ref;
    current_color = $("input", facet).val();
    $("span.facet.border").removeClass("border");
    $(facet).find("span.facet").addClass("border");
    words = d3.selectAll("span.word");
    _ref = window.all_colors;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      color = _ref[_i];
      words.classed(color + "-vis", false);
    }
    return words.data(window.frequencies[current_color]).classed(current_color + "-vis", function(d) {
      return d > 0;
    }).transition().style("font-size", function(d) {
      return (15 + 20 * d) + "px";
    });
  };

}).call(this);
