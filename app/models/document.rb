class Document < ActiveRecord::Base
  has_many :markings
  has_many :prisms
  attr_accessible :title, :author, :content

  validates :title,  :presence => true
  validates :author, :presence => true 
  validates :content, :presence => true 
end
