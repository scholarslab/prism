describe 'On the highlighting page', ->
    beforeEach ->
        jasmine.getFixtures().fixturesPath = 'spec/fixtures/'
        loadFixtures('jasmine/highlight.html')
        setup_highlight()
    describe 'default category', ->
        it 'puts a border', ->
            expect($("#highlighters span.facet").eq(0)).toHaveClass("border")
    describe 'clicking a facet', ->
        it 'selects the facet you click on', ->
            $("li.facet").eq(1).click()
            expect($("#highlighters span.facet").eq(1)).toHaveClass("border")
    describe 'highlighting', ->
        it 'adds the right class to words', ->
            $("li.facet").eq(0).click()
            $("span.word_11").mousedown()
            expect($("span.word_11")).toHaveClass("blue")
        it 'adds the word to the word list', ->
            $("li.facet").eq(0).click()
            $("span.word_11").mousedown()
            $("span.word_12").mouseover()
            $("span.word_12").mouseup()
            $("span.word_13").mouseover()
            expect($("#blue_indices")).toHaveValue("[11,12]")
    describe 'deleting', ->
        it 'removes classes from words', ->
            word11 = $("span.word_11")
            $("li.facet").eq(0).click()
            word11.mousedown()
            word11.mouseup()
            $("li.facet").eq(1).click()
            word11.mousedown()
            word11.mouseup()
            expect(word11).toHaveClass("blue")
            expect(word11).toHaveClass("red")
            $("li.facet").eq(2).click()
            word11.mousedown()
            word11.mouseup()
            expect(word11).not.toHaveClass(".blue")
            expect(word11).not.toHaveClass(".red")
        it 'removes the word from the word list', ->
            $("li.facet").eq(0).click()
            $("span.word_11").mousedown()
            $("span.word_12").mouseover()
            $("span.word_12").mouseup()
            $("span.word_13").mouseover()
            expect($("#blue_indices")).toHaveValue("[11,12]")
            $("li.facet").eq(2).click()
            $("span.word_11").mousedown()
            $("span.word_11").mouseup()
            expect($("#blue_indices")).toHaveValue("[12]")
