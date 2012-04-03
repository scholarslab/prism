class PrismsController < ApplicationController 
    before_filter :authenticate_user!
    def highlight
        @title = "Highlight"
        @prism = Prism.find(params[:id])
        @document = @prism.document
    end

    def highlight_post
        prism = Prism.find(params[:id])
        for facet in prism.facets
            indices = params[(facet.color + "_indices").to_sym]
            Marking.new(word_array:indices, prism:prism, facet:facet, user:current_user).save()
        end
            redirect_to(visualize_path(prism))    
    end

    def visualize
        @title = "Visualize"
        @prism = Prism.find(params[:id])
        @document = @prism.document

        @frequencies = {}
        for facet in @prism.facets
            # Step 1: Create a list of N 0s, where N is the total number of words
            @frequencies[facet.color] = [0.0] * @document.num_words
            # Step 2: For each marking, update the frequencies with which words were marked
            for marking in facet.markings
                for word_num in JSON.load(marking.word_array)
                    # To scale accordingly, # of times word was marked divided by total # of markings
                    @frequencies[facet.color][word_num] += 1.0 / facet.markings.length
                end
            end
        end
    end
end