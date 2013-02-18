require 'spec_helper'

describe "authentications/show" do
  before(:each) do
    @authentication = assign(:authentication, stub_model(Authentication,
      :user_id => 1,
      :provider => "Provider",
      :uid => "Uid",
      :index => "Index",
      :create => "Create",
      :destroy => "Destroy"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Provider/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uid/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Index/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Create/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Destroy/)
  end
end
