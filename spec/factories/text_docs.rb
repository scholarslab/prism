# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text_doc do
    markup "MyString"
    format "MyString"
    text nil
    span nil
  end
end
