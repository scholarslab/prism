class User < ActiveRecord::Base

  ROLES = %w[admin user]

  has_many :prisms
  has_many :word_markings

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    User.find_from_auth(
      auth.provider, auth.info.email, auth.extra.raw_info.name, auth.uid
    )
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    User.find_from_auth('google', data['email'], data['name'], data['uid'])
  end

  def self.find_for_browserid_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    User.find_from_auth('browserid', data['email'], data['name'], data['uid'])
  end

  def self.find_from_auth(provider, email, name, uid)
    user = User.where(:email => email).first
    if user
      # Update the login information to the most current every time someone
      # logs in. This makes sure that the avatar is coming from wherever they
      # logged in from for that session.
      user.update_attributes(
        :provider => provider,
        :uid      => uid,
      )
    else
      user = User.create(
        name: name,
        provider: provider,
        uid: uid,
        email: email,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

