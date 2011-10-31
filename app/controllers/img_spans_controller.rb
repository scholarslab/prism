class ImgSpansController < ApplicationController
  # GET /img_spans
  # GET /img_spans.json
  def index
    @img_spans = ImgSpan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @img_spans }
    end
  end

  # GET /img_spans/1
  # GET /img_spans/1.json
  def show
    @img_span = ImgSpan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @img_span }
    end
  end

  # GET /img_spans/new
  # GET /img_spans/new.json
  def new
    @img_span = ImgSpan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @img_span }
    end
  end

  # GET /img_spans/1/edit
  def edit
    @img_span = ImgSpan.find(params[:id])
  end

  # POST /img_spans
  # POST /img_spans.json
  def create
    @img_span = ImgSpan.new(params[:img_span])

    respond_to do |format|
      if @img_span.save
        format.html { redirect_to @img_span, notice: 'Img span was successfully created.' }
        format.json { render json: @img_span, status: :created, location: @img_span }
      else
        format.html { render action: "new" }
        format.json { render json: @img_span.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /img_spans/1
  # PUT /img_spans/1.json
  def update
    @img_span = ImgSpan.find(params[:id])

    respond_to do |format|
      if @img_span.update_attributes(params[:img_span])
        format.html { redirect_to @img_span, notice: 'Img span was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @img_span.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /img_spans/1
  # DELETE /img_spans/1.json
  def destroy
    @img_span = ImgSpan.find(params[:id])
    @img_span.destroy

    respond_to do |format|
      format.html { redirect_to img_spans_url }
      format.json { head :ok }
    end
  end
end
