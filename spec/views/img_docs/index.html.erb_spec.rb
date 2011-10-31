require 'spec_helper'

describe "img_docs/index.html.erb" do
  before(:each) do
    assign(:img_docs, [
      stub_model(ImgDoc,
        :img => "",
        :format => "Format",
        :text => nil,
        :span => nil
      ),
      stub_model(ImgDoc,
        :img => "",
        :format => "Format",
        :text => nil,
        :span => nil
      )
    ])
  end

  it "renders a list of img_docs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
