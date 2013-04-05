class PrismsController < ApplicationController
  before_filter :authenticate_user!, :only => [:highlight, :highlight_post, :visualize]

  def highlight
    @title = "Highlight"
    @prism = Prism.find(params[:id])
    @document = @prism.document
  end

  def sandbox_highlight
    @title = "Highlight"
    @prism = Document.where(:sandbox => true)[0].prisms[0]
    @document = @prism.document
    render "highlight"
  end

  def sandbox_post
    prism = Document.where(:sandbox => true)[0].prisms[0]
    save_markings(prism)

    redirect_to(sandbox_visualize_path(prism))
  end

  def highlight_post
    prism = Prism.find(params[:id])
    save_markings(prism)

    redirect_to(visualize_path(prism))
  end

  def sandbox_visualize
    @title = "Sandbox Visualize"
    @prism = Document.where(:sandbox => true)[0].prisms[0]
    @document = @prism.document

    @frequencies = calculate_freuquencies(@prism, @document.num_words)

    render "visualize"
  end

  def visualize
    @title = "Visualize"
    @prism = Prism.find(params[:id])
    @document = @prism.document
    @markings = @prism.markings 
    @usercounter = 0

    users = []
    for marking in @markings
      if ! users.include?(marking.user)
        users.push(marking.user)
        @usercounter += 1
      end
    end

    @frequencies = calculate_freuquencies(@prism, @document.num_words)
  end

  private

  def save_markings(prism)
    for facet in prism.facets
      indices = params[(facet.color + "_indices").to_sym]
      Marking.new(word_array:indices, prism:prism, facet:facet, user:current_user).save()
    end
  end

  def calculate_freuquencies(prism, num_words)
    frequencies = {}

    for facet in prism.facets
      # Step 1: Create a list of N 0s, where N is the total number of words
      frequencies[facet.color] = [0.0] * num_words
      # Step 2: For each marking, update the frequencies with which words were marked
      for marking in facet.markings
        if marking.word_array != ""
          for word_num in JSON.load(marking.word_array)
            # To scale accordingly, # of times word was marked divided by total # of markings
            frequencies[facet.color][word_num] += 1.0 / facet.markings.length
          end
        end
      end
    end
    frequencies
  end
    def new
      @prism = Prism.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @prism }  
      end
    end
  
    def create
      @prism = Prism.new(params[:prism])
      @prism.content = process_text(@prism.content)
       
      respond_to do |format|
        if @prism.save
          format.html { redirect_to visualize_path(@prism), notice: 'Prism was successfully created.' }
          format.json { render json: @prism, status: :created, location: @prism }
        else
          format.html { render action: "new" }
          format.json { render json: @prism.errors, status: :unprocessable_entity }
        end
      end
    end
  

    def update
      @prism = Prism.find(params[:id])
      @prism.content = process_text(@prism.content)
      
      respond_to do |format|
        if @prism.update_attributes(params[:prism])
          format.html { redirect_to visualize_path(@prism), notice: 'Prism was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @prism.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def process_text(text)
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
      doc.root().to_s()
    end
end
