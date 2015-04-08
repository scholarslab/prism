class FacetsController < ApplicationController

	def new
	end

	def create
		Facet.create(facet_params)
	end

	def edit
	end

	def update
	end

	private

	def facet_params
		params.require(:description, :prism_id, :order, :color)
	end

end
