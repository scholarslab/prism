class WordMarking < ActiveRecord::Base
  belongs_to :prism
  belongs_to :user
  belongs_to :facet
  
# A word_marking is a single marking instance on a single word.
# When visualizing, the system collects and totals all the word_markings associated with a particular word on a particular facet.

  attr_accessible :index, :prism, :prism_id, :user, :user_id, :facet, :facet_id 

  def self.parseJSONArray(json)
    indexes = nil

    if json.nil? || json.empty?
      indexes = []
    else
      indexes = JSON.load json
    end

    indexes
  end

  def self.importIndexes(user, prism, facet, indexes)
    word_count = prism.num_words
    prism_id   = prism.id
    facet_id   = facet.id

    markings   = indexes.each.reject { |i| i > word_count }.map do |index|
      WordMarking.new(user: user,
                      prism_id: prism_id,
                      facet_id: facet_id,
                      index: index)
    end

    WordMarking.import markings
  end
end
