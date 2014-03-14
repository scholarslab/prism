class Prism < ActiveRecord::Base
  has_many :word_markings
  belongs_to :users
  has_many :facets
  attr_accessible :title, :author, :content, :num_words, :description, :user_id, :unlisted, :publication_date, :language, :license, :uuid
  validates_presence_of :title, :content, :license

# A prism is the document a user wishes other readers to interpret along particular facets.
# In other words, a prism is an uploaded text which a group of readers is expected to mark along pre-selected interpretive categories.
# A document, when uploaded, is split into an array consisting of individual words.

  self.primary_key ='uuid'

  before_create :set_uuid
  def set_uuid
    require 'uuidtools'
    self.uuid = UUIDTools::UUID.timestamp_create().to_s
  end
end


