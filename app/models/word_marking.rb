class WordMarking < ActiveRecord::Base
  belongs_to :prism
  belongs_to :user
  belongs_to :facet
  
# A word_marking is a single marking instance on a single word.
# When visualizing, the system collects and totals all the word_markings associated with a particular word on a particular facet.

  attr_accessible :index, :prism, :prism_id, :user, :user_id, :facet, :facet_id 
end
