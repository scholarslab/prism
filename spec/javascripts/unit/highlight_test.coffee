describe 'highlight', ->
    beforeEach ->
        jasmine.getFixtures().fixturesPath = 'spec/fixtures/'
        # loadFixtures('poe.html')
        loadFixtures('jasmine/highlight.html')
    describe 'default category', ->
        it 'puts a border', ->
            # console.log(readFixtures("poe.html"))
            expect($("#highlighters span.facet")).toHaveClass("border")


