class PagesController < ApplicationController
  def index
    @title = "Home"
    @documents = Document.find(:all)
  end
  
  def about
    @title = "About Prism"
  end
end
