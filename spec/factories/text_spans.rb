# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text_span do
    start 1
    length 1
    session "MyString"
    tag nil
    doc nil
  end
end
