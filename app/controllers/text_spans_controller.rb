class TextSpansController < ApplicationController
  # GET /text_spans
  # GET /text_spans.json
  def index
    @text_spans = TextSpan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_spans }
    end
  end

  # GET /text_spans/1
  # GET /text_spans/1.json
  def show
    @text_span = TextSpan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_span }
    end
  end

  # GET /text_spans/new
  # GET /text_spans/new.json
  def new
    @text_span = TextSpan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_span }
    end
  end

  # GET /text_spans/1/edit
  def edit
    @text_span = TextSpan.find(params[:id])
  end

  # POST /text_spans
  # POST /text_spans.json
  def create
    @text_span = TextSpan.new(params[:text_span])

    respond_to do |format|
      if @text_span.save
        format.html { redirect_to @text_span, notice: 'Text span was successfully created.' }
        format.json { render json: @text_span, status: :created, location: @text_span }
      else
        format.html { render action: "new" }
        format.json { render json: @text_span.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_spans/1
  # PUT /text_spans/1.json
  def update
    @text_span = TextSpan.find(params[:id])

    respond_to do |format|
      if @text_span.update_attributes(params[:text_span])
        format.html { redirect_to @text_span, notice: 'Text span was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_span.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_spans/1
  # DELETE /text_spans/1.json
  def destroy
    @text_span = TextSpan.find(params[:id])
    @text_span.destroy

    respond_to do |format|
      format.html { redirect_to text_spans_url }
      format.json { head :ok }
    end
  end
end
