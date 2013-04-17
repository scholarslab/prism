class WordMarking < ActiveRecord::Base
  belongs_to :prism
  has_and_belongs_to_many :facets
  
  attr_accessible :index, :prism_id, :user, :facet_id
end
