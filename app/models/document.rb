class Document < ActiveRecord::Base
  attr_accessible :title, :author, :content

  validates :title,  :presence => true
  validates :author, :presence => true 
  validates :content, :presence => true 
end
