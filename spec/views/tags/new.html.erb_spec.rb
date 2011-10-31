require 'spec_helper'

describe "tags/new.html.erb" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :color => "MyString",
      :name => "MyString",
      :text => nil,
      :img_spans => nil,
      :text_spans => nil
    ).as_new_record)
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tags_path, :method => "post" do
      assert_select "input#tag_color", :name => "tag[color]"
      assert_select "input#tag_name", :name => "tag[name]"
      assert_select "input#tag_text", :name => "tag[text]"
      assert_select "input#tag_img_spans", :name => "tag[img_spans]"
      assert_select "input#tag_text_spans", :name => "tag[text_spans]"
    end
  end
end
