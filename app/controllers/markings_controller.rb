class MarkingsController < ApplicationController

  before_filter :get_topic, :only => [:create, :edit, :update]

  # GET /markings
  # GET /markings.json
  def index

    @markings = Marking.find(:all)

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /markings/new
  def new
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

  end

  def update
  end

  private
  def get_marking
    @marking = Marking.find(params[:id])
  end
end

