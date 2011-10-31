# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :img_doc do
    img ""
    format "MyString"
    text nil
    span nil
  end
end
