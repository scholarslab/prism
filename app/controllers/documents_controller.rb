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
  
    def new
      @document = Document.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @document }  
      end
    end
  
    
    # POST /documents
    # POST /documents.json
    def create
      @document = Document.new(params[:document])
      respond_to do |format|
        if @document.save
          format.html { redirect_to @document, notice: 'Document was successfully created.' }
          format.json { render json: @document, status: :created, location: @document }
        else
          format.html { render action: "new" }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /documents/1
    # PUT /documents/1.json
    def update
      @document = Document.find(params[:id])
  
      respond_to do |format|
        if @document.update_attributes(params[:document])
          format.html { redirect_to @document, notice: 'Document was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /documents/1
    # DELETE /documents/1.json
    def destroy
      @document = Document.find(params[:id])
      @document.destroy
  
      respond_to do |format|
        format.html { redirect_to documents_url }
        format.json { head :no_content }
      end
    end
end

