class Facet < ActiveRecord::Base
  belongs_to :prism
  validates :color,  :presence => true
  validates :category, :presence => true 

end
