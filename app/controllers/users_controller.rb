class UsersController < ApplicationController

  def show
    @user = current_user	
    if @user != nil
    	@prisms = @user.prisms
    	@highlighted_prisms = @user.word_markings.map(&:prism_id).uniq
	    @title = "myprisms"
    else
    	redirect_to :home
    	flash[:error] ="Sign in first!"
    end
  end
end
