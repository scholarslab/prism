class Prism < ActiveRecord::Base
  has_many :word_markings
  belongs_to :users
  has_many :facets
  attr_accessible :title, :author, :content, :num_words, :description, :user_id, :unlisted, :publication_date, :language, :license, :uuid
  validates_presence_of :title, :content, :license

  # Develop had self.primary_key ='uuid' pre-merge, if the following doesn't work.
  set_primary_key "uuid"

	before_create :set_uuid
	def set_uuid
	    require 'uuidtools'
	    self.uuid = UUIDTools::UUID.timestamp_create().to_s
	end
end
  

