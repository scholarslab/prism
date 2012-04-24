(function() {

  describe('On the highlighting page', function() {
    beforeEach(function() {
      jasmine.getFixtures().fixturesPath = 'spec/fixtures/';
      loadFixtures('jasmine/highlight.html');
      return setup_highlight();
    });
    describe('default category', function() {
      return it('puts a border', function() {
        return expect($("#highlighters span.facet").eq(0)).toHaveClass("border");
      });
    });
    describe('clicking a facet', function() {
      return it('selects the facet you click on', function() {
        $("li.facet").eq(1).click();
        return expect($("#highlighters span.facet").eq(1)).toHaveClass("border");
      });
    });
    describe('highlighting', function() {
      it('adds the right class to words', function() {
        $("li.facet").eq(0).click();
        $("span.word_11").mousedown();
        return expect($("span.word_11")).toHaveClass("blue");
      });
      return it('adds the word to the word list', function() {
        $("li.facet").eq(0).click();
        $("span.word_11").mousedown();
        $("span.word_12").mouseover();
        $("span.word_12").mouseup();
        $("span.word_13").mouseover();
        return expect($("#blue_indices")).toHaveValue("[11,12]");
      });
    });
    return describe('deleting', function() {
      it('removes classes from words', function() {
        var word11;
        word11 = $("span.word_11");
        $("li.facet").eq(0).click();
        word11.mousedown();
        word11.mouseup();
        $("li.facet").eq(1).click();
        word11.mousedown();
        word11.mouseup();
        expect(word11).toHaveClass("blue");
        expect(word11).toHaveClass("red");
        $("li.facet").eq(2).click();
        word11.mousedown();
        word11.mouseup();
        expect(word11).not.toHaveClass(".blue");
        return expect(word11).not.toHaveClass(".red");
      });
      return it('removes the word from the word list', function() {
        $("li.facet").eq(0).click();
        $("span.word_11").mousedown();
        $("span.word_12").mouseover();
        $("span.word_12").mouseup();
        $("span.word_13").mouseover();
        expect($("#blue_indices")).toHaveValue("[11,12]");
        $("li.facet").eq(2).click();
        $("span.word_11").mousedown();
        $("span.word_11").mouseup();
        return expect($("#blue_indices")).toHaveValue("[12]");
      });
    });
  });

}).call(this);
