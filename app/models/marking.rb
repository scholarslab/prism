class Marking < ActiveRecord::Base
  belongs_to :user
  belongs_to :prism
  attr_accessible :user_id, :word_array, :facet_id, :prism_id , :facet_num
end
