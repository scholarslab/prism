class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])	
    @prisms = @user.prisms

    @highlighted_prisms = @user.word_markings.map(&:prism_id).uniq

  end
end
