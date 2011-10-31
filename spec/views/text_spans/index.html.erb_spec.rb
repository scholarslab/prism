require 'spec_helper'

describe "text_spans/index.html.erb" do
  before(:each) do
    assign(:text_spans, [
      stub_model(TextSpan,
        :start => 1,
        :length => 1,
        :session => "Session",
        :tag => nil,
        :doc => nil
      ),
      stub_model(TextSpan,
        :start => 1,
        :length => 1,
        :session => "Session",
        :tag => nil,
        :doc => nil
      )
    ])
  end

  it "renders a list of text_spans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Session".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
