
require 'spec_helper'

feature 'Visitor to the visualization page' do
  scenario 'should see the font-size visualization pane.' do
    prism = FactoryGirl.create(:prism)
    [:facet_blue, :facet_red, :facet_green].each { |mock| FactoryGirl.create(mock) }
    url = "/prisms/#{prism.id}/visualize"

    visit url
    page.should have_content 'Font Size Visualization'
  end
end

