require 'set'

class PrismsController < ApplicationController 
  before_filter :authenticate_user!, :only => [:new, :highlight, :highlight_post] 
  
  # this method appears in both the model and the controller. Shane deleted it on his controller on the feature branch.
  def before_create()
    require 'uuidtools'
    self.id = UUID.timestamp_create().to_s
  end

  def index
    @prisms = []
    for prism in Prism.all
      if !prism.unlisted
        @prisms << prism
      end
    end
    @title = "Browse prisms"

    respond_to do |format|
      format.html
      format.json { render :json => @prisms }
    end
  end

  def highlight
      @title = "Highlight"
      @prism = Prism.find(params[:id])
  end

  def highlight_post
      @prism = Prism.find(params[:id])
      for facet in @prism.facets
          indices = params[("facet#{facet.order}_indices").to_sym]
          if JSON.load(indices)
            for index in JSON.load(indices)
                word_marking = WordMarking.new(user:current_user, index:index, facet:facet, prism:@prism)
                word_marking.save()
            end
          end
      end
      redirect_to(visualize_path(@prism))    
  end

  def visualize
    @title = "Visualize"
    @prism = Prism.find(params[:id])
    @word_markings = @prism.word_markings 
    @usercounter = 0
    
    users = []
    @frequencies = {}
    
    for facet in @prism.facets
      @frequencies[facet.order] = [0.0] * @prism.num_words
    end
    
    for word_marking in @prism.word_markings
        # Make accessible the count of all the markings per word per facet
        @frequencies[word_marking.facet.order][word_marking.index] += 1.0
    end   
  end

  def new
    @prism = Prism.new
    @facet1 = Facet.new
    @facet2 = Facet.new
    @facet3 = Facet.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prism }  
    end
  end

  def create
    @prism = Prism.new(params[:prism])
    @prism.user_id = current_user.id
    @facet1 = Facet.new(params[:facet1]) 
    @facet2 = Facet.new(params[:facet2]) 
    @facet3 = Facet.new(params[:facet3]) 
    
    @facet1.order = 0
    @facet1.color = "blue"
    @facet2.order = 1
    @facet2.color = "red"
    @facet3.order = 2
    @facet3.color = "green"
    
    #validate_colors
    
    process_text(@prism)
    success = @prism.save
    
    if @facet1.description.to_s.length > 0
      @facet1.prism = @prism
      success = success && @facet1.save
    end
    if @facet2.description.to_s.length > 0
      @facet2.prism = @prism
      success = success && @facet2.save
    end
    if @facet3.description.to_s.length > 0
      @facet3.prism = @prism
      success = success && @facet3.save
    end
    
    respond_to do |format|
      if success 
        if @prism.unlisted?
          notice = "This prism will not show up in the public browse page. Be sure to copy the link to send to your friends!"
        else
          notice = "Prism was successfully created."
        end
          format.html { redirect_to highlight_path(@prism), notice: "success" }
          format.json { render json: @prism, status: :created, location: @prism }
      else
        format.html { render action: "new" }
        format.json { render json: @prism.errors, status: :unprocessable_entity }
      end
    end
  end         

  def process_text(prism)
    text = prism.content
    doc = Nokogiri::XML("")
    doc << doc.create_element("content")
    counter = 0
    for line in text.split("\n")
      leading_spaces = line[/\A +/]
      if leading_spaces
        line = "&nbsp;"*leading_spaces.size() + line[leading_spaces.size()..-1]
      end
      line.gsub!("\t","&nbsp;&nbsp;&nbsp;")

      paragraph = doc.create_element("p")
      doc.root().add_child(paragraph)
      span_list = line.split(" ").map do |word|
        span = doc.create_element("span", :class => "word word_"+counter.to_s)
        span << word + ' '
        counter += 1
        span
      end
      span_nodeset = Nokogiri::XML::NodeSet.new(doc, span_list)
      paragraph << span_nodeset
    end
    prism.content=doc.root().to_s()
    prism.num_words = counter
  end

  def destroy
    @prism = Prism.find(params[:id])
    # Markings table no longer exists. We would need to switch it to facets?
    for marking in @prism.markings
      marking.destroy
    end

    for word_marking in @prism.word_markings
      word_marking.destroy
    end

    respond_to do |format|
      if @prism.destroy
        format.html { redirect_to prisms_path, notice: 'Prism was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to prisms_path, notice: 'Prism could not be destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def validate_colors
      for facet in [@facet1, @facet2, @facet3]
        if facet.color.to_s.strip.length!=6
          facet.color = "000000"
          facet.color[facet.order*2,2] = "FF"
        end
      end
  end
end
