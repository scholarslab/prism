require 'set'

class PrismsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :highlight, :highlight_post]
  before_filter :get_prism, :only => [:highlight, :highlight_post, :destroy]

  #caches_action :index, :layout => false
  caches_action :show, :layout => false
  caches_action :visualize, :layout => false

  def index
    @prisms = Prism.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    @title = "Browse"

    for prism in Prism.all
      if !prism.unlisted
        @prisms << prism
      end
    end

    respond_to do |format|
      format.html
      format.json { render :json => @prisms }
    end
  end

  def highlight
    @title = "Highlight"
  end

  def highlight_post

    @prism.facets.each do |facet|
      param   = params[("facet#{facet.order}_indices").to_sym]
      indexes = WordMarking.parseJSONArray param
      WordMarking.importIndexes current_user, @prism, facet, indexes
    end
    expire_action :action => :visualize
    redirect_to(visualize_path(@prism))
  end

  def visualize
    @title = "Visualize"

    @prism = Prism.includes(:word_markings).find(params[:id])
    @word_markings = @prism.word_markings
    @usercounter = 0

    @frequencies = @prism.calc_frequencies

  end

  def new
    @prism = Prism.new
    @facet1 = Facet.new
    @facet2 = Facet.new
    @facet3 = Facet.new
    @language_dump = LanguageList::COMMON_LANGUAGES
    @languages = []
    @language_dump.each do |lang|
      @languages.push(lang.name)
    end

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

    @prism.add_content_spans
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
          notice = "Success! Keep in mind that this prism will not show up in the public browse page. Be sure to copy the link to send to your friends!"
        else
          notice = "Prism was successfully created."
        end
        format.html { redirect_to highlight_path(@prism), notice: notice }
        format.json { render json: @prism, status: :created, location: @prism }
      else
        format.html { render action: "new" }
        format.json { render json: @prism.errors, status: :unprocessable_entity }
      end
    end
  end

  #def validate_colors
    #for facet in [@facet1, @facet2, @facet3]
      #if facet.color.to_s.strip.length!=6
        #facet.color = "000000"
        #facet.color[facet.order*2,2] = "FF"
      #end
    #end
  #end

  def destroy

    respond_to do |format|
      if authorize! :destroy, @prism
        @prism.destroy
        format.html { redirect_to users_path, notice: 'Prism was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to users_path, notice: 'Prism could not be destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def get_prism
    @prism = Prism.find(params[:id])
  end

end
