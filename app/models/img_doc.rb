class ImgDoc < ActiveRecord::Base
  belongs_to :text
  belongs_to :span
end
