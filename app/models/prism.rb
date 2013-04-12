class Prism < ActiveRecord::Base
  has_many :markings
  has_many :word_markings
  attr_accessible :prompt, :document_id, :title, :author, :content, :sandbox, :num_words, :facet1, :facet2, :facet3, :facet4, :description, :user_id, :unlisted, :publication_date
end

