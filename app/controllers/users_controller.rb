class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])	
	    @prisms = @user.prisms
		
		# @word_markings = @user.word_markings
		@highlighted_prisms = @user.word_markings.prism.uniq
		
	end
end
