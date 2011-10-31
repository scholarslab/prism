require 'spec_helper'

describe "img_docs/show.html.erb" do
  before(:each) do
    @img_doc = assign(:img_doc, stub_model(ImgDoc,
      :img => "",
      :format => "Format",
      :text => nil,
      :span => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Format/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
