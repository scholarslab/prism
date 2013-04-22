class Facet < ActiveRecord::Base
  has_many :word_markings
  belongs_to :prism
 
  attr_accessible :description, :prism_id, :order, :color
end