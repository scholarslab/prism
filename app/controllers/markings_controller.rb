class MarkingsController < ApplicationController

  def index
    @markings = Marking.find(:all)
  end
  
  def new
    @document = Document.find(params['id'])

    @marking = Marking.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @marking }
    end
 end

def edit
    @marking = Marking.find(params[:id])
  end

 def create
    @marking = Marking.new(params[:marking])
    respond_to do |format|
      if @marking.save
        format.html { redirect_to(visualize_path) }
        format.json { render json: @marking, status: :created, location: @marking }
      else
        format.html { render action: "new" }
        format.json { render json: @marking.errors, status: :unprocessable_entity }
      end
    end

def update
    @marking = Marking.find(params[:id])

    respond_to do |format|
      if @marking.update_attributes(params[:topic])
        format.html { redirect_to(visualize_path) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @marking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @marking = Marking.find(params[:id])
    @marking.destroy

    respond_to do |format|
      format.html { redirect_to(visualize_path) }
      format.json { head :ok }
    end
  end
end
end
