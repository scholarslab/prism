require 'spec_helper'

describe "img_spans/index.html.erb" do
  before(:each) do
    assign(:img_spans, [
      stub_model(ImgSpan,
        :vector => "Vector",
        :session => "Session",
        :tag => nil,
        :doc => nil
      ),
      stub_model(ImgSpan,
        :vector => "Vector",
        :session => "Session",
        :tag => nil,
        :doc => nil
      )
    ])
  end

  it "renders a list of img_spans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vector".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Session".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
