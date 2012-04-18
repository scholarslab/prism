class PrismsController < ApplicationController 
    before_filter :authenticate_user!, :only => [:highlight, :highlight_post, :visualize] 

    def highlight
        @title = "Highlight"
        @prism = Prism.find(params[:id])
        @document = @prism.document
    end

    def sandbox_highlight
        @title = "Highlight"
        @prism = Document.where(:sandbox => true)[0].prisms[0]            
        @document = @prism.document
        render "highlight"
    end

    def sandbox_post
        prism = Document.where(:sandbox => true)[0].prisms[0]
        for facet in prism.facets
            indices = params[(facet.color + "_indices").to_sym]
            Marking.new(word_array:indices, prism:prism, facet:facet, user:current_user).save()
        end
        redirect_to(sandbox_visualize_path(prism))    
    end
    def highlight_post
        prism = Prism.find(params[:id])
        for facet in prism.facets
            indices = params[(facet.color + "_indices").to_sym]
            Marking.new(word_array:indices, prism:prism, facet:facet, user:current_user).save()
        end
        redirect_to(visualize_path(prism))    
    end

    def sandbox_visualize
        @title = "Sandbox Visualize"
        @prism = Document.where(:sandbox => true)[0].prisms[0]
        @document = @prism.document
        @frequencies = {}
        for facet in @prism.facets
            # Step 1: Create a list of N 0s, where N is the total number of words
            @frequencies[facet.color] = [0.0] * @document.num_words
            # Step 2: For each marking, update the frequencies with which words were marked
            for marking in facet.markings
                if marking.word_array != ""
                    for word_num in JSON.load(marking.word_array)
                        # To scale accordingly, # of times word was marked divided by total # of markings
                        @frequencies[facet.color][word_num] += 1.0 / facet.markings.length
                    end
                end
            end
        end
        render "visualize"
    end

    def visualize
        @title = "Visualize"
        @prism = Prism.find(params[:id])
        @document = @prism.document
        @markings = @prism.markings 
        @usercounter = 0
        
        users = []
        for marking in @markings
            if ! users.include?(marking.user)
                users.push(marking.user)
                @usercounter += 1
            end
        end
        
        @frequencies = {}
        for facet in @prism.facets
            # Step 1: Create a list of N 0s, where N is the total number of words
            @frequencies[facet.color] = [0.0] * @document.num_words
            # Step 2: For each marking, update the frequencies with which words were marked
            for marking in facet.markings
                if marking.word_array != ""
                    for word_num in JSON.load(marking.word_array)
                        # To scale accordingly, # of times word was marked divided by total # of markings
                        @frequencies[facet.color][word_num] += 1.0 / facet.markings.length
                    end
                end
            end
        end
    end
end
