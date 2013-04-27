require 'spec_helper'

describe Prism do
  it "has a valid factory" do
    Factory.create(:prism).should be_valid
  end

  it "is valid without a title" do
    Factory.build(:prism, title: nil).should be_valid
  end

  it "is valid without content" do
    Factory.build(:prism, content: nil).should be_valid
  end

  describe "filter prisms" do
    before :each do
      @waynebot = Factory.create(:prism, title: "Facebook Game Apps Development")
      @erochester = Factory.create(:prism, title: 'Clojure Data Analysis Cookbook')
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

