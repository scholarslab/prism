class TextDoc < ActiveRecord::Base
  belongs_to :text
  has_many :span
end
