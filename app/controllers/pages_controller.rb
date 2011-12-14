class PagesController < ApplicationController
  def index
    @title = "Home"
  end
  
  def about
    @title = "About Prism"
  end
end
