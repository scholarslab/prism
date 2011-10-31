class Tag < ActiveRecord::Base
  belongs_to :text
  belongs_to :img_spans
  belongs_to :text_spans
end
