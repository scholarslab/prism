class DocumentsController < ApplicationController
  def index
    @title = "Browse Texts"
    @documents = Document.find(:all)
  end

  def show
    @document = Document.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end
end
