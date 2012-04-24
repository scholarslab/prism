describe 'On the visualize page', ->
    beforeEach ->
        jasmine.getFixtures().fixturesPath = 'spec/fixtures/'
        loadFixtures('jasmine/visualize.html')
        setup_visualize()
    describe 'setup_visualize', ->
        it 'correctly sets all_colors', ->
            expect(all_colors).toEqual(["blue", "red"])
        it 'correctly sets frequencies', ->
            correct_freqs = {
                "blue": [0.5, 0.0, 1.0, 0.2, 0.2],
                "red": [0.0, 0.0, 0.0, 0.2, 1]
            }
            expect(frequencies).toEqual(correct_freqs)
        it 'correctly binds click handlers', ->
            $("li.vis_facet").first().click()
            expect($("span.facet").eq(0)).toHaveClass("border")
    describe 'select_facet', ->
        it 'correctly selects the facet', ->
            select_facet($("li.vis_facet").first())
            expect($("span.facet").eq(0)).toHaveClass("border")
        it 'correctly colors words for the facet', ->
            select_facet($("li.vis_facet").first())
            expect($("span.word_0")).toHaveClass("blue-vis")
            expect($("span.word_1")).not.toHaveClass("blue-vis")
            expect($("span.word_2")).toHaveClass("blue-vis")
            expect($("span.word_3")).toHaveClass("blue-vis")
            expect($("span.word_4")).toHaveClass("blue-vis")

