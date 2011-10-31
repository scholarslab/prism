require 'spec_helper'

describe "text_docs/new.html.erb" do
  before(:each) do
    assign(:text_doc, stub_model(TextDoc,
      :markup => "MyString",
      :format => "MyString",
      :text => nil,
      :span => nil
    ).as_new_record)
  end

  it "renders new text_doc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => text_docs_path, :method => "post" do
      assert_select "input#text_doc_markup", :name => "text_doc[markup]"
      assert_select "input#text_doc_format", :name => "text_doc[format]"
      assert_select "input#text_doc_text", :name => "text_doc[text]"
      assert_select "input#text_doc_span", :name => "text_doc[span]"
    end
  end
end
