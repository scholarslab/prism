# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facet do
    color "MyString"
    category "MyString"
  end

  factory :facet_blue, class: Facet do
    color "blue"
    description Forgery::LoremIpsum.words(3)
    order 0
  end

  factory :facet_red, class: Facet do
    color "red"
    description Forgery::LoremIpsum.words(3)
    order 1
  end

  factory :facet_green, class: Facet do
    color "green"
    description Forgery::LoremIpsum.words(3)
    order 2
  end
end
