class Prism < ActiveRecord::Base
  belongs_to :document
  has_many :markings
  has_many :word_markings
  has_many :facets
  attr_accessible :prompt, :document_id, :document, :title, :author, :description, :content, :num_words, :sandbox, :facet1, :facet2, :facet3, :facet4
end
