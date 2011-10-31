require 'spec_helper'

describe "text_spans/show.html.erb" do
  before(:each) do
    @text_span = assign(:text_span, stub_model(TextSpan,
      :start => 1,
      :length => 1,
      :session => "Session",
      :tag => nil,
      :doc => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Session/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
