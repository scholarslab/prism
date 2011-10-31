require 'spec_helper'

describe "text_spans/edit.html.erb" do
  before(:each) do
    @text_span = assign(:text_span, stub_model(TextSpan,
      :start => 1,
      :length => 1,
      :session => "MyString",
      :tag => nil,
      :doc => nil
    ))
  end

  it "renders the edit text_span form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => text_spans_path(@text_span), :method => "post" do
      assert_select "input#text_span_start", :name => "text_span[start]"
      assert_select "input#text_span_length", :name => "text_span[length]"
      assert_select "input#text_span_session", :name => "text_span[session]"
      assert_select "input#text_span_tag", :name => "text_span[tag]"
      assert_select "input#text_span_doc", :name => "text_span[doc]"
    end
  end
end
