class WordMarking < ActiveRecord::Base
  belongs_to :prism
  belongs_to :user
  belongs_to :facet
  
  attr_accessible :index, :prism, :prism_id, :user, :user_id, :facet, :facet_id 
end
