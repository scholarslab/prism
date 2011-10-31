class Text < ActiveRecord::Base
  has_many :tags
  belongs_to :text_doc
  belongs_to :img_doc
end
