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

  describe "add_content_spans", :current => true do
    it "should not process prisms with no title." do
      prism   = Factory.build(:prism, title: nil)
      content = prism.content

      prism.add_content_spans

      prism.content.should eq(content)
      prism.num_words.should be_nil
    end

    it "should not process prisms with no content." do
      prism   = Factory.build(:prism, content: nil)
      content = prism.content

      prism.add_content_spans

      prism.content.should eq(content)
      prism.num_words.should be_nil
    end

    it "should add span elements." do
      prism = Factory.build(:prism)
      prism.content.should_not match(/<span class=/)
      prism.add_content_spans
      prism.content.should match(/<span class=/)
    end

    it "should set the num_words." do
      prism = Factory.build(:prism)
      prism.num_words.should be_nil
      prism.add_content_spans
      prism.num_words.should > 0
    end

    it "should insert &nbsp; for leading spaces." do
      prism = Factory.build(:prism, content: "    has space.")
      prism.add_content_spans
      prism.content.should match(/&#xA0;&#xA0;&#xA0;&#xA0;/)
    end

    it "should replace tabs with 3 &nbsp;." do
      prism = Factory.build(:prism, content: "\thas space.")
      prism.add_content_spans
      prism.content.should match(/&#xA0;&#xA0;&#xA0;/)
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

