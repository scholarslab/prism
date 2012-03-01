# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title Forgery::LoremIpsum.words(3)
    author Forgery::Name.full_name
    pub_date Forgery::Basic.number
    description Forgery::LoremIpsum.paragraphs(1)
    format "Song"
    content Forgery::LoremIpsum.paragraphs(5)
  end
end

