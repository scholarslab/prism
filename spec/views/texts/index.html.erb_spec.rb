require 'spec_helper'

describe "texts/index.html.erb" do
  before(:each) do
    assign(:texts, [
      stub_model(Text,
        :title => "Title",
        :author => "Author",
        :tags => nil,
        :text_doc => nil,
        :img_doc => nil
      ),
      stub_model(Text,
        :title => "Title",
        :author => "Author",
        :tags => nil,
        :text_doc => nil,
        :img_doc => nil
      )
    ])
  end

  it "renders a list of texts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
