class PagesController < ApplicationController

  def index
    @title = "Home"
  end

  def about
    @title = "About"
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
