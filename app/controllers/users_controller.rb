class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])	
    @prisms = @user.prisms
	end
end
