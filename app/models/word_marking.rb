class WordMarking < ActiveRecord::Base
  belongs_to :prism
  belongs_to :facet
  
  attr_accessible :index, :prism_id, :user, :facet_id
end
