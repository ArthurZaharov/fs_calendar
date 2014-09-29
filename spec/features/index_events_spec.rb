require 'rails_helper'

feature "Index events", type: :feature do
	let(:user) { create(:user) }
	let(:other_user) { create(:user) }
	let(:calendar_event) { create(:calendar_event, date: Time.now) }
	let(:other_calendar_event) { create(:calendar_event, date: Time.now) }

	before(:each) do
		sign_in user
		user.calendar_events << calendar_event
		other_user.calendar_events << other_calendar_event
		click_link "Home"
	end

	scenario "all events" do
		expect(page).to have_text(calendar_event.title)
		expect(page).to have_text(other_calendar_event.title)
	end

	scenario "signed in user events", js: true do
		click_button "My events"

		expect(page).to have_text(calendar_event.title)
		expect(page).to_not have_text(other_calendar_event.title)
	end
end