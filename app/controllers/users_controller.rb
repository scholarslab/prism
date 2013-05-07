class UsersController < ApplicationController
  def show
    @user = current_user	
    @prisms = @user.prisms

    @highlighted_prisms = @user.word_markings.map(&:prism_id).uniq

    @title = "myprisms"
  end
end
