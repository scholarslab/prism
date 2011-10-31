require 'spec_helper'

describe "img_docs/new.html.erb" do
  before(:each) do
    assign(:img_doc, stub_model(ImgDoc,
      :img => "",
      :format => "MyString",
      :text => nil,
      :span => nil
    ).as_new_record)
  end

  it "renders new img_doc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => img_docs_path, :method => "post" do
      assert_select "input#img_doc_img", :name => "img_doc[img]"
      assert_select "input#img_doc_format", :name => "img_doc[format]"
      assert_select "input#img_doc_text", :name => "img_doc[text]"
      assert_select "input#img_doc_span", :name => "img_doc[span]"
    end
  end
end
