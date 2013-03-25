# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    email "fred.foonly@example.com"
    password "my_password"
    nickname "Fred"
    login { "#{email}" }
  end

  factory :emailless, class: User do
  	password "my_password"
  	nickname "Fred w/o e-mail"
    login { "#{nickname}"}
  end

  factory :nicknameless, class: User do
  	email "fred.foonly_noemail@example.com"
  	password "my_password"
    login { "#{email}" }
  end
  
end

