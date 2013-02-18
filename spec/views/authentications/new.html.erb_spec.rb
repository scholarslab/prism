require 'spec_helper'

describe "authentications/new" do
  before(:each) do
    assign(:authentication, stub_model(Authentication,
      :user_id => 1,
      :provider => "MyString",
      :uid => "MyString",
      :index => "MyString",
      :create => "MyString",
      :destroy => "MyString"
    ).as_new_record)
  end

  it "renders new authentication form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => authentications_path, :method => "post" do
      assert_select "input#authentication_user_id", :name => "authentication[user_id]"
      assert_select "input#authentication_provider", :name => "authentication[provider]"
      assert_select "input#authentication_uid", :name => "authentication[uid]"
      assert_select "input#authentication_index", :name => "authentication[index]"
      assert_select "input#authentication_create", :name => "authentication[create]"
      assert_select "input#authentication_destroy", :name => "authentication[destroy]"
    end
  end
end
