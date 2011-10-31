# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :img_span do
    vector "MyString"
    session "MyString"
    tag nil
    doc nil
  end
end
