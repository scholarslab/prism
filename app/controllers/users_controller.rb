class UsersController < ApplicationController
	def show
		@user = User.find([:id])	
	end
end