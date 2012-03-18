# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :marking do
    start_pos 1
    end_pos 2
    association :document
  end
end
