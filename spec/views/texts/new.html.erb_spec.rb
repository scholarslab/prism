require 'spec_helper'

describe "texts/new.html.erb" do
  before(:each) do
    assign(:text, stub_model(Text,
      :title => "MyString",
      :author => "MyString",
      :tags => nil,
      :text_doc => nil,
      :img_doc => nil
    ).as_new_record)
  end

  it "renders new text form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => texts_path, :method => "post" do
      assert_select "input#text_title", :name => "text[title]"
      assert_select "input#text_author", :name => "text[author]"
      assert_select "input#text_tags", :name => "text[tags]"
      assert_select "input#text_text_doc", :name => "text[text_doc]"
      assert_select "input#text_img_doc", :name => "text[img_doc]"
    end
  end
end
