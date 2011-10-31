# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text do
    title "MyString"
    author "MyString"
    pub_date "2011-10-31"
    tags nil
    text_doc nil
    img_doc nil
  end
end
