require 'spec_helper'

describe WordMarking do
  it "has a valid factory" do
    Factory.build(:word_marking).should be_valid
  end

end
