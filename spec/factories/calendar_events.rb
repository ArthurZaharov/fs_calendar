# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar_event do
    title { Faker::Lorem.sentence }
    date { 1.day.ago }
    repeat "once"
  end
end
