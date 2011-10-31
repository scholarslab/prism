require 'spec_helper'

describe "img_spans/show.html.erb" do
  before(:each) do
    @img_span = assign(:img_span, stub_model(ImgSpan,
      :vector => "Vector",
      :session => "Session",
      :tag => nil,
      :doc => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vector/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Session/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
