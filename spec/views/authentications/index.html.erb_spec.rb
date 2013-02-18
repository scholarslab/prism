require 'spec_helper'

describe "authentications/index" do
  before(:each) do
    assign(:authentications, [
      stub_model(Authentication,
        :user_id => 1,
        :provider => "Provider",
        :uid => "Uid",
        :index => "Index",
        :create => "Create",
        :destroy => "Destroy"
      ),
      stub_model(Authentication,
        :user_id => 1,
        :provider => "Provider",
        :uid => "Uid",
        :index => "Index",
        :create => "Create",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of authentications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
