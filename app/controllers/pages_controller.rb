class PagesController < ApplicationController
  def index
    @title = "Home"
    @documents = Document.find([1,2,3])
  end
  
  def about
    @title = "About Prism"
  end
end
