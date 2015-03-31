class Facet < ActiveRecord::Base
  has_many :word_markings
  belongs_to :prism

# Facets are the parameters along which a user will mark a particular prism.
# In other words, they are the pre-selected categories along which a reader will be interpreting the document in question.
# Facets are selected by the uploader of a particular prism.

end
