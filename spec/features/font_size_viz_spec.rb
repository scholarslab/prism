
require 'spec_helper'

feature 'Visitor to the visualization page' do
  background do
    @prism = FactoryGirl.create(:prism, :unlisted => false)
    @facets = [:facet_blue, :facet_red, :facet_green].each do |mock|
      FactoryGirl.create(mock)
    end
    @url = "/prisms/#{@prism.id}/visualize"
  end

  scenario 'should have a list of prisms.' do
    visit '/prisms'
    page.should have_content(@prism.title)
  end

  scenario 'should see the font-size visualization pane.' do
    visit @url
    page.should have_content 'Font Size Visualization'
  end

  scenario 'should not see the font-size visualization by default.' do
    visit @url
    find('p', :text => 'The larger the font size').should_not be_visible
  end

  scenario 'should click on the Font Size Visualization and see the visualization.' do
    visit @url
    find('h3', :text => 'Font Size Visualization' ).click
    find('p',  :text => 'The larger the font size').should be_visible
  end
end

