require 'spec_helper'

describe "text_docs/edit.html.erb" do
  before(:each) do
    @text_doc = assign(:text_doc, stub_model(TextDoc,
      :markup => "MyString",
      :format => "MyString",
      :text => nil,
      :span => nil
    ))
  end

  it "renders the edit text_doc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => text_docs_path(@text_doc), :method => "post" do
      assert_select "input#text_doc_markup", :name => "text_doc[markup]"
      assert_select "input#text_doc_format", :name => "text_doc[format]"
      assert_select "input#text_doc_text", :name => "text_doc[text]"
      assert_select "input#text_doc_span", :name => "text_doc[span]"
    end
  end
end
