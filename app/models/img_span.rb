class ImgSpan < ActiveRecord::Base
  belongs_to :tag
  belongs_to :doc
end
