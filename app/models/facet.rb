class Facet < ActiveRecord::Base
  belongs_to :prism
  has_many :markings
  validates :color,  :presence => true
  validates :category, :presence => true 
  attr_accessible :color, :category, :prism_id, :prism
end
