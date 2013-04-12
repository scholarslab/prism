class Prism < ActiveRecord::Base
  has_many :markings
  has_many :word_markings
  attr_accessible :prompt, :document_id, :title, :author, :content, :sandbox, :num_words, :facet1, :facet2, :facet3, :facet4, :description, :user_id, :unlisted, :publication_date
  set_primary_key "uuid"

	before_create :set_uuid
	def set_uuid
	    require 'uuidtools'
	    self.uuid = UUIDTools::UUID.timestamp_create().to_s
	end
end

