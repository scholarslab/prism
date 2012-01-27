class DocumentsController < ApplicationController
  #The following line authenticates users for this controller using devise
  before_filter :authenticate_user!
 
  def index
    @title = "Browse Texts"
    @documents = Document.find(:all)
    @user_email = current_user.email
  end

  def show
    @document = Document.find(params[:id])
    @user_email = current_user.email
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end
end
