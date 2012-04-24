(function() {

  (typeof exports !== "undefined" && exports !== null ? exports : this).setup_highlight = function() {
    var all_colors, color, current_color, currently_marking, facet, get_word_number, mark, storage, val, _i, _j, _len, _len2, _ref;
    $("#highlighters span.facet").first().addClass('border');
    all_colors = [];
    _ref = $("li.facet");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      facet = _ref[_i];
      val = $("input", facet).val();
      if (val !== "delete") all_colors.push(val);
    }
    storage = {};
    for (_j = 0, _len2 = all_colors.length; _j < _len2; _j++) {
      color = all_colors[_j];
      storage[color] = {};
    }
    get_word_number = function(elt) {
      var match, re;
      re = new RegExp("word_\\d+");
      match = re.exec($(elt).attr("class"))[0];
      return parseInt(match.substring(5));
    };
    mark = function(elt, color) {
      var number, numbers, s, _k, _len3, _results;
      number = get_word_number(elt);
      if (color === "delete") {
        for (_k = 0, _len3 = all_colors.length; _k < _len3; _k++) {
          color = all_colors[_k];
          $(elt).removeClass(color);
          delete storage[color][number];
        }
      } else {
        $(elt).addClass(color);
        storage[color][number] = true;
      }
      _results = [];
      for (color in storage) {
        numbers = [];
        for (number in storage[color]) {
          numbers.push(parseInt(number));
        }
        s = JSON.stringify(numbers);
        _results.push($("#" + color + "_indices").val(s));
      }
      return _results;
    };
    currently_marking = false;
    current_color = all_colors[0];
    $("span.word").mousedown(function(event) {
      event.preventDefault();
      currently_marking = true;
      return mark(this, current_color);
    });
    $("span.word").mouseover(function() {
      if (currently_marking) return mark(this, current_color);
    });
    $("html").mouseup(function() {
      return currently_marking = false;
    });
    return $("li.facet").click(function() {
      current_color = $("input", this).val();
      $("span.facet.border").removeClass("border");
      return $(this).find("span.facet").addClass("border");
    });
  };

}).call(this);
