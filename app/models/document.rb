class Document < ActiveRecord::Base
  has_many :markings
  has_many :prisms

  validates :title,  :presence => true
  validates :author, :presence => true 
  validates :content, :presence => true 

  attr_accessible :title, :author, :sandbox, :content, :pub_date, :description, :format, :num_words
end
