class TextDocsController < ApplicationController
  # GET /text_docs
  # GET /text_docs.json
  def index
    @text_docs = TextDoc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_docs }
    end
  end

  # GET /text_docs/1
  # GET /text_docs/1.json
  def show
    @text_doc = TextDoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_doc }
    end
  end

  # GET /text_docs/new
  # GET /text_docs/new.json
  def new
    @text_doc = TextDoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_doc }
    end
  end

  # GET /text_docs/1/edit
  def edit
    @text_doc = TextDoc.find(params[:id])
  end

  # POST /text_docs
  # POST /text_docs.json
  def create
    @text_doc = TextDoc.new(params[:text_doc])

    respond_to do |format|
      if @text_doc.save
        format.html { redirect_to @text_doc, notice: 'Text doc was successfully created.' }
        format.json { render json: @text_doc, status: :created, location: @text_doc }
      else
        format.html { render action: "new" }
        format.json { render json: @text_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_docs/1
  # PUT /text_docs/1.json
  def update
    @text_doc = TextDoc.find(params[:id])

    respond_to do |format|
      if @text_doc.update_attributes(params[:text_doc])
        format.html { redirect_to @text_doc, notice: 'Text doc was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_docs/1
  # DELETE /text_docs/1.json
  def destroy
    @text_doc = TextDoc.find(params[:id])
    @text_doc.destroy

    respond_to do |format|
      format.html { redirect_to text_docs_url }
      format.json { head :ok }
    end
  end
end
