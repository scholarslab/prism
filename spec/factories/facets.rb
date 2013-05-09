# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facet do
    color "MyString"
    category "MyString"
  end

  factory :facet_blue, class: Facet do
    color "blue"
    description "sad"
    order 0
  end

  factory :facet_red, class: Facet do
    color "red"
    description "happy"
    order 1
  end

  factory :facet_green, class: Facet do
    color "green"
    description "peaceful"
    order 2
  end
end
