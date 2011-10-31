class Text < ActiveRecord::Base
  belongs_to :tags
  belongs_to :text_doc
  belongs_to :img_doc
end
