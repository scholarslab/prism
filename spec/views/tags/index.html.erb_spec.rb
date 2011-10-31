require 'spec_helper'

describe "tags/index.html.erb" do
  before(:each) do
    assign(:tags, [
      stub_model(Tag,
        :color => "Color",
        :name => "Name",
        :text => nil,
        :img_spans => nil,
        :text_spans => nil
      ),
      stub_model(Tag,
        :color => "Color",
        :name => "Name",
        :text => nil,
        :img_spans => nil,
        :text_spans => nil
      )
    ])
  end

  it "renders a list of tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
