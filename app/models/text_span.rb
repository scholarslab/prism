class TextSpan < ActiveRecord::Base
  belongs_to :tag
  belongs_to :doc
end
