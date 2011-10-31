require 'spec_helper'

describe "text_docs/show.html.erb" do
  before(:each) do
    @text_doc = assign(:text_doc, stub_model(TextDoc,
      :markup => "Markup",
      :format => "Format",
      :text => nil,
      :span => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Markup/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Format/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
