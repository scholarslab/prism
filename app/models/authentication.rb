class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :create, :destroy, :index, :provider, :uid, :user_id
end
