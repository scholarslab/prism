# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title "MyString"
    author "MyString"
    pub_date 1
    description "MyText"
    format "MyString"
  end
end
