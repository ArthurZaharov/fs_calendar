require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do
	let(:calendar_event) { build(:calendar_event) }

	it { should respond_to(:title) }
	it { should respond_to(:date) }
	it { should belong_to(:user) }

	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:date) }
	it { should validate_presence_of(:repeat) }

	describe "all events for date" do
		let!(:calendar_event_once) { create(:calendar_event, user_id: '1', date: "2014-09-09 UTC", repeat: 'once') }
		let!(:calendar_event_daily) { create(:calendar_event, user_id: '2', date: "2014-09-08 UTC", repeat: 'daily') }
		let!(:calendar_event_weekly) { create(:calendar_event, user_id: '3', date: "2014-09-07 UTC", repeat: 'weekly') }
		let!(:calendar_event_monthly) { create(:calendar_event, user_id: '4', date: "2014-09-06 UTC", repeat: 'monthly') }
		let!(:calendar_event_yearly) { create(:calendar_event, user_id: '5', date: "2014-09-05 UTC", repeat: 'yearly') }

		it "don't return events" do
			expect(CalendarEvent.all_events_for(Date.parse("2014-08-06 UTC"))).to match_array []
		end

		it "return yearly and daily events" do
			expect(CalendarEvent.all_events_for(Date.parse("2015-09-05 UTC"))).to match_array [calendar_event_daily, calendar_event_yearly]
		end

		it "return monthly and daily events" do
			expect(CalendarEvent.all_events_for(Date.parse("2014-10-06 UTC"))).to match_array [calendar_event_daily, calendar_event_monthly]
		end

		it "return weekly and daily events" do
			expect(CalendarEvent.all_events_for(Date.parse("2014-09-14 UTC"))).to match_array [calendar_event_daily, calendar_event_weekly]
		end

		it "return once and daily events" do
			expect(CalendarEvent.all_events_for(Date.parse("2014-09-09 UTC"))).to match_array [calendar_event_once, calendar_event_daily]
		end

		it "return daily event" do
			expect(CalendarEvent.all_events_for(Date.parse("2014-09-10 UTC"))).to match_array [calendar_event_daily]
		end
	end

	describe "events for user" do
		let!(:user) { create(:user) }
		let!(:calendar_event_once) { create(:calendar_event, user_id: user.id, date: "2014-09-09 UTC") }
		let!(:other_calendar_event) { create(:calendar_event, date: "2014-09-09 UTC") }

	  it "return only signed in users events" do
			expect(CalendarEvent.events_for(user, Date.parse("2014-09-09 UTC"))).to match_array [calendar_event_once]
		end
	end

	describe "all events" do
	  let!(:older_calendar_event) { create(:calendar_event, date: "2014-09-09 15:00:00 UTC", repeat: 'daily') }
	  let!(:newer_calendar_event) { create(:calendar_event, date: "2014-09-09 5:00:00 UTC", repeat: 'daily') }
	  let!(:fresh_calendar_event) { create(:calendar_event, date: "2014-09-10 3:10:00 UTC") }

	  it "have ASC order" do
	  	expect(CalendarEvent.all_events_for(Date.parse("2014-09-10 UTC"))).to eq [fresh_calendar_event, newer_calendar_event, older_calendar_event]
	  end
	end
end
