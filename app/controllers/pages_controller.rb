class PagesController < ApplicationController

  #caches_page :index, :about

  def index
    @title = "Home"
    @prisms = Prism.all()[0..2]
  end
  
  def about
    @title = "About Prism"
  end

  def alumni
  	@title = "Alumni"
  end

  def terms
    @title = "Terms of Service"
  end

  def future
    @title = "Future Directions"
  end

  def demo
    @title = "Demo"
  end
end
