class Prism < ActiveRecord::Base
  belongs_to :document
  has_many :markings
  has_many :facets
  attr_accessible :prompt, :document_id, :document
end
