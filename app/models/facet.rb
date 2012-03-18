class Facet < ActiveRecord::Base
  belongs_to :prism
  has_many :markings
  validates :color,  :presence => true
  validates :category, :presence => true 

end
# == Schema Information
#
# Table name: facets
#
#  id         :integer         not null, primary key
#  color      :string(255)
#  category   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

