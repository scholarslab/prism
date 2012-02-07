# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |user|
  user.email "fred.foonly@example.com"
  user.password "my_password"
end

