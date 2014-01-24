
require 'spec_helper'

feature 'Visitor to the visualization page' do
  background do
    @prism = FactoryGirl.create(:prism)
    puts "prism = '#{@prism.uuid}'\n"
    # [:facet_blue, :facet_red, :facet_green].each do |mock|
      # f = FactoryGirl.create(mock)
      # f.prism = @prism
      # puts "\trelation => '#{f.prism_id}'\n"
    # end
    puts "\tlength = #{@prism.facets.length}\n"
    @url = "/prisms/#{@prism.id}/visualize"
  end

  scenario 'should see the font-size visualization pane.' do
    visit @url
    page.should have_content 'Font Size Visualization'
  end

  scenario 'should not see the font-size visualization by default.' do
    visit @url
    find('p', :text => 'The larger the font size').should_not be_visible
  end

  context 'enables the Font Size Visualization' do
    background do
      visit @url
      find('h3', :text => 'Font Size Visualization').click
    end

    scenario 'should click on the Font Size Visualization and see the visualization.' do
      find('p', :text => 'The larger the font size').should be_visible
      screenshot_and_save_page
    end
  end

end

