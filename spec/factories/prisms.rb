# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :prism do
    title Forgery::LoremIpsum.words(1)
    author Forgery::Name.full_name
    content Forgery::LoremIpsum.paragraphs(5)
    description Forgery::LoremIpsum.paragraphs(1)
    publication_date Forgery::Basic.number
    license 'cc0'
    user_id Forgery::Basic.number
    unlisted false
    language 'English'
 
  end

  factory :prism_unlisted do
    title Forgery::LoremIpsum.words(1)
    author Forgery::Name.full_name
    content Forgery::LoremIpsum.paragraphs(5)
    description Forgery::LoremIpsum.paragraphs(1)
    publication_date Forgery::Basic.number
    unlisted true
    license 'by'
  end

end
