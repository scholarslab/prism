require 'spec_helper'

describe "img_spans/edit.html.erb" do
  before(:each) do
    @img_span = assign(:img_span, stub_model(ImgSpan,
      :vector => "MyString",
      :session => "MyString",
      :tag => nil,
      :doc => nil
    ))
  end

  it "renders the edit img_span form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => img_spans_path(@img_span), :method => "post" do
      assert_select "input#img_span_vector", :name => "img_span[vector]"
      assert_select "input#img_span_session", :name => "img_span[session]"
      assert_select "input#img_span_tag", :name => "img_span[tag]"
      assert_select "input#img_span_doc", :name => "img_span[doc]"
    end
  end
end
