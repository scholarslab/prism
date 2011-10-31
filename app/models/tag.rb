class Tag < ActiveRecord::Base
  belongs_to :text
  has_many :img_spans
  has_many :text_spans
end
