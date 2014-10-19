# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar_event do
    title { Faker::Lorem.sentence }
    date { 1.day.ago }
    repeat 'once'

    factory :daily_calendar_event do
      repeat 'daily'
    end

    factory :weekly_calendar_event do
      repeat 'weekly'
    end

    factory :monthly_calendar_event do
      repeat 'monthly'
    end

    factory :yearly_calendar_event do
      repeat 'yearly'
    end
  end
end
