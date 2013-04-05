# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word_marking do
    index 1
    facet1_count 1
    facet2_count 1
    facet3_count 1
    facet4_count 1
    prism nil
  end
end
