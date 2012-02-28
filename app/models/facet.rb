class Facet < ActiveRecord::Base
  belongs_to :prism
  has_many :markings
  validates :color,  :presence => true
  validates :category, :presence => true 

end
