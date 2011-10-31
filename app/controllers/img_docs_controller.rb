class ImgDocsController < ApplicationController
  # GET /img_docs
  # GET /img_docs.json
  def index
    @img_docs = ImgDoc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @img_docs }
    end
  end

  # GET /img_docs/1
  # GET /img_docs/1.json
  def show
    @img_doc = ImgDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @img_doc }
    end
  end

  # GET /img_docs/new
  # GET /img_docs/new.json
  def new
    @img_doc = ImgDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @img_doc }
    end
  end

  # GET /img_docs/1/edit
  def edit
    @img_doc = ImgDoc.find(params[:id])
  end

  # POST /img_docs
  # POST /img_docs.json
  def create
    @img_doc = ImgDoc.new(params[:img_doc])

    respond_to do |format|
      if @img_doc.save
        format.html { redirect_to @img_doc, notice: 'Img doc was successfully created.' }
        format.json { render json: @img_doc, status: :created, location: @img_doc }
      else
        format.html { render action: "new" }
        format.json { render json: @img_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /img_docs/1
  # PUT /img_docs/1.json
  def update
    @img_doc = ImgDoc.find(params[:id])

    respond_to do |format|
      if @img_doc.update_attributes(params[:img_doc])
        format.html { redirect_to @img_doc, notice: 'Img doc was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @img_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /img_docs/1
  # DELETE /img_docs/1.json
  def destroy
    @img_doc = ImgDoc.find(params[:id])
    @img_doc.destroy

    respond_to do |format|
      format.html { redirect_to img_docs_url }
      format.json { head :ok }
    end
  end
end
