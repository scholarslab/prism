class PagesController < ApplicationController

  caches_page :index, :about

  def index
    @title = "Home"
    @documents = Document.all()[0..2]
  end
  
  def about
    @title = "About Prism"
  end
end
