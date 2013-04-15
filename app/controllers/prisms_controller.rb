require 'set'

class PrismsController < ApplicationController 
    before_filter :authenticate_user!, :only => [:new, :highlight, :highlight_post] 

    def before_create()
        require 'uuidtools'
        self.id = UUID.timestamp_create().to_s
    end

    def highlight
        @title = "Highlight"
        @prism = Prism.find(params[:id])
    end

    def sandbox_highlight
        @title = "Highlight"
        @prism = Prism.find(params[:id])            
        @document = @prism.document
        render "highlight"
    end

    def sandbox_post
        prism = Prism.find(params[:id])
        if @prism.facet1?
            indices = params[("facet1_indices").to_sym]
            Marking.new(user_id:current_user, word_array:indices, facet_num: 1, prism_id:prism).save()
        end
        if @prism.facet2?
            indices = params[("facet2_indices").to_sym]
            Marking.new(user_id:current_user, word_array:indices, facet_num: 2, prism_id:prism).save()
        end
        if @prism.facet3?
            indices = params[("facet3_indices").to_sym]
            Marking.new(user_id:current_user, word_array:indices, facet_num: 3, prism_id:prism).save()
        end
        if @prism.facet4?
            indices = params[("facet4_indices").to_sym]
            Marking.new(user_id:current_user, word_array:indices, facet_num: 4, prism_id:prism).save()
        end
        redirect_to(sandbox_visualize_path(prism))    
    end
    def highlight_post
        prism = Prism.find(params[:id])
        if prism.facet1?
            indices = params[("facet1_indices").to_sym]
            marking = Marking.new(user:current_user, word_array:indices, facet_num: 1, prism:prism)
            marking.save()
            update_word_markings(marking)
        end
        if prism.facet2?
            indices = params[("facet2_indices").to_sym]
            marking = Marking.new(user:current_user, word_array:indices, facet_num: 2, prism:prism)
            marking.save()
            update_word_markings(marking)
        end
        if prism.facet3?
            indices = params[("facet3_indices").to_sym]
            marking = Marking.new(user:current_user, word_array:indices, facet_num: 3, prism:prism)
            marking.save()
            update_word_markings(marking)
        end
        if prism.facet4?
            indices = params[("facet4_indices").to_sym]
            marking = Marking.new(user:current_user, word_array:indices, facet_num: 4, prism:prism)
            marking.save()
            update_word_markings(marking)
        end
        redirect_to(visualize_path(prism))    
    end

    def sandbox_visualize
        @title = "Sandbox Visualize"
        @prism = Document.where(:sandbox => true)[0].prisms[0]
        @frequencies = {}
              # Step 1: Create a list of N 0s, where N is the total number of words
        @frequencies["red"] = [0.0] * @prism.num_words
        @frequencies["blue"] = [0.0] * @prism.num_words
        @frequencies["green"] = [0.0] * @prism.num_words
        @frequencies["yellow"] = [0.0] * @prism.num_words
            # Step 2: For each marking, update the frequencies with which words were marked
                for word_marking in @prism.word_markings
                    # To scale accordingly, # of times word was marked divided by total # of markings
                    if @prism.facet1?
                        @frequencies["red"][word_markings.index] += 1.0 / word_marking.facet1_count
                    end
                    if @prism.facet2? 
                        @frequencies["blue"][word_markings.index] += 1.0 / word_marking.facet2_count
                    end
                    if @prism.facet3?
                        @frequencies["green"][word_markings.index] += 1.0 / word_marking.facet3_count
                    end
                    if @prism.facet4?
                        @frequencies["yellow"][word_markings.index] += 1.0 / word_marking.facet4_count
                    end
                end 
        render "visualize"
    end

    def visualize
        @title = "Visualize"
        @prism = Prism.find(params[:id])
        @markings = @prism.markings 
        @usercounter = 0
        
        users = []
        for marking in @markings
            if ! users.include?(marking.user)
                users.push(marking.user)
                @usercounter += 1
            end
        end
        
        @frequencies = {}
        @frequencies["red"] = [0.0] * @prism.num_words
        @frequencies["blue"] = [0.0] * @prism.num_words
        @frequencies["green"] = [0.0] * @prism.num_words
        @frequencies["yellow"] = [0.0] * @prism.num_words
        
        # Step 2: For each marking, update the frequencies with which words were marked
        for word_marking in @prism.word_markings
            # To scale accordingly, # of times word was marked divided by total # of markings
            if @prism.facet1 && word_marking.facet1_count > 0
                @frequencies["red"][word_marking.index] += 1.0 / word_marking.facet1_count
            end
            if @prism.facet2 && word_marking.facet2_count > 0 
                @frequencies["green"][word_marking.index] += 1.0 / word_marking.facet2_count
            end
            if @prism.facet3 && word_marking.facet3_count > 0
                @frequencies["blue"][word_marking.index] += 1.0 / word_marking.facet3_count
            end
            if @prism.facet4 && word_marking.facet4_count > 0
                @frequencies["yellow"][word_marking.index] += 1.0 / word_marking.facet4_count
            end
        end         
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
      process_text(@prism)
      word_markings = Array.new
      for word_index in Array(0..@prism.num_words)
        word_markings << WordMarking.new(prism:@prism, index:word_index, facet1_count: 0, facet2_count: 0, facet3_count: 0, facet4_count: 0)
        
      end
      success = @prism.save
      for word_marking in word_markings
            word_marking.prism = @prism
            success = success && word_marking.save
      end
      respond_to do |format|
        if success
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
      process_text(@prism)

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

    def update_word_markings(marking)
        @prism = Prism.find(params[:id])
        # goes through each word marked
        word_marking_map = Hash.new
        for word_marking in @prism.word_markings
            word_marking_map[word_marking.index] = word_marking
        end

        # searches the set of markings to find out if the index of a marked word matches the current word index under examination.
        touched_word_markings = Set.new

        # does this for each facet, and will add one to the word_marking facet count if the facet exists and it is marked
        for word_index in JSON.load(marking.word_array)
            if marking.facet_num == 1
                word_marking_map[word_index].facet1_count += 1
                touched_word_markings.add(word_index)
            elsif marking.facet_num == 2
                word_marking_map[word_index].facet2_count += 1
                touched_word_markings.add(word_index)
            elsif   marking.facet_num == 3
                word_marking_map[word_index].facet3_count += 1
                touched_word_markings.add(word_index)
            elsif marking.facet_num == 4
                word_marking_map[word_index].facet4_count += 1
                touched_word_markings.add(word_index)
            end
        end
        for touched in touched_word_markings
            word_marking_map[touched].save
        end
    end

def destroy
    @prism = Prism.find(params[:id])
    for marking in @prism.markings
        marking.destroy
    end
    for word_marking in @prism.word_markings
        word_marking.destroy
    end
     respond_to do |format|
        if @prism.destroy
          format.html { redirect_to index, notice: 'Prism was successfully destroyed.' }
          format.json { head :no_content }
        else
          format.html { redirect_to index, notice: 'Prism could not be destroyed.' }
          format.json { head :no_content }
        end
    end
end

end
