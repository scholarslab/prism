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
    user_id    = user.id
    prism_id   = prism.id
    facet_id   = facet.id
    existing   = WordMarking
      .where(user_id: user_id,
             prism_id: prism_id,
             facet_id: facet_id)
      .map { |m| m.index }
      .to_set

    columns  = [:user_id, :prism_id, :facet_id, :index]
    markings = indexes
      .reject { |i| i > word_count }
      .reject { |i| existing.include? i }
      .map { |index| [user_id, prism_id, facet_id, index] }

    WordMarking.import columns, markings
  end
end
