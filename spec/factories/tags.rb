# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    color "MyString"
    name "MyString"
    text nil
    img_spans nil
    text_spans nil
  end
end
