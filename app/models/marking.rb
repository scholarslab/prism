class Marking < ActiveRecord::Base
  belongs_to :user
  belongs_to :prism
  belongs_to :document
  belongs_to :facet

  attr_accessible :user_id, :word_array, :facet_id, :prism_id, :user, :prism, :document, :facet
end
