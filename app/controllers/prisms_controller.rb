class PrismsController < ApplicationController
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
    end
end
