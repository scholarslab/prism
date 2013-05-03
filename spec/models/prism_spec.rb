require 'spec_helper'

describe Prism do
  it "has a valid factory" do
    Factory.create(:prism).should be_valid
  end

  it "is not valid without a title" do
    Factory.build(:prism, title: nil).should_not be_valid
  end

  it "is not valid without content" do
    Factory.build(:prism, content: nil).should_not be_valid
  end
  
  it "is not valid without license" do
    Factory.build(:prism, license: nil).should_not be_valid
  end

  describe "filter prisms" do
    before :each do
      @waynebot = Factory.create(:prism, title: "Facebook Game Apps Development")
      @erochester = Factory.create(:prism, title: 'Clojure Data Analysis Cookbook')
      @shanelin = Factory.create(:prism, title: 'The Black Hand: Organized Crime and Terrorism in Early 20th Century America')
    end
  end
end
# == Schema Information
#
# Table name: prisms
#
#  id         :integer         not null, primary key
#  prompt     :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

