class Marking < ActiveRecord::Base
  belongs_to :user
  belongs_to :prism
  belongs_to :document
  belongs_to :facet
end
