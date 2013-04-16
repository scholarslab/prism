class Prism < ActiveRecord::Base
  has_many :word_markings
  has_many :facets
  attr_accessible :title, :author, :content, :num_words, :description, :user_id, :unlisted, :publication_date, :language
  set_primary_key "uuid"

	before_create :set_uuid
	def set_uuid
	    require 'uuidtools'
	    self.uuid = UUIDTools::UUID.timestamp_create().to_s
	end
end

