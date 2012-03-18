class Marking < ActiveRecord::Base
  belongs_to :user
  belongs_to :prism
  belongs_to :document
  belongs_to :facet
end
# == Schema Information
#
# Table name: markings
#
#  id          :integer         not null, primary key
#  start_pos   :integer
#  end_pos     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  document_id :integer
#  user_id     :integer
#

