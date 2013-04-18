class WordMarking < ActiveRecord::Base
  belongs_to :prism
  attr_accessible :facet1_count, :facet2_count, :facet3_count, :facet4_count, :index, :prism_id
end
