class Prism < ActiveRecord::Base
  belongs_to :document
  has_many :markings
  has_many :facets
end
# == Schema Information
#
# Table name: prisms
#
#  id         :integer         not null, primary key
#  prompt     :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

