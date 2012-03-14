class MarkingsController < ApplicationController

  before_filter :get_marking, :only => [:create, :edit, :update, :destroy]

  # GET /markings
  # GET /markings.json
  def index

    @markings = Marking.find(:all)
    @title = "Highlights"

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /markings/new
  def new
    @doc = Document.find(params[:documents_id])

    @title = "Highlight"


    @marking = Marking.new
  end

  # GET /documents/markings/1/edit
  def edit
  end

  # POST /markings
  def create
    @marking = Marking.new(params[:marking])

    respond_to do |format|
      if @marking.save
        format.html { redirect_to(visualization_path) }
        format.json { render json: @marking, status: created, location: @marking }
      else
        format.html { render action: "new" }
        format.json { render json: @marking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @marking.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end

  def update
    respond_to do |format|
      if @marking.update_attributes(param[:id])
        format.html { redirect_to @marking, notic: 'Highlight saved' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @marking.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def get_marking
    @marking = Marking.find(params[:id])
  end
end
