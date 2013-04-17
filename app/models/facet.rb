class Facet < ActiveRecord::Base
  has_and_belongs_to_many :word_markings
  belongs_to :prism
 
  attr_accessible :description, :prism_id, :order
end