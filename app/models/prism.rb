class Prism < ActiveRecord::Base
  belongs_to :document
  has_many :markings
  has_many :facets
end
