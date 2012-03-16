class Document < ActiveRecord::Base
  has_many :markings
  has_many :prisms

  validates :title,  :presence => true
  validates :author, :presence => true 
  validates :content, :presence => true 
end
# == Schema Information
#
# Table name: documents
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  author      :string(255)
#  pub_date    :integer
#  description :text
#  format      :string(255)
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

