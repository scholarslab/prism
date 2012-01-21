require 'spec_helper'

describe Document do

  before(:each) do
    @attr = { :title => "The Illiad", :author => "William D. Shakespeare", :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit." }
  end

  it "should create a new instance given valid attributes" do
    Document.create!(@attr)
  end

  it "should require a title" do
    no_title_document = Document.new(@attr.merge(:title => ""))
    no_title_document.should_not be_valid
  end
  it "should require an author" do
    no_author_document = Document.new(@attr.merge(:author => ""))
    no_author_document.should_not be_valid
  end
    it "should require content" do
    no_content_document = Document.new(@attr.merge(:content => ""))
    no_content_document.should_not be_valid
  end
end
