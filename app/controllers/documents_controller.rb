class DocumentsController < ApplicationController
  def index
    @title = "Browse Texts"
    @documents = Document.find(:all)
    # @user_email = current_user.email
  end

  def show
    @document = Document.find(params[:id])
    # @user_email = current_user.email
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end
end
