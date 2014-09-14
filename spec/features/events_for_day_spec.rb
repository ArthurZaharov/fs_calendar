require 'rails_helper'

feature "Events", type: :feature do
	let(:user) { create(:user) }

	before { sign_in user }

	scenario "not present for this day" do
		visit root_path

		expect(page).to have_text("No events for this day")
	end

	scenario "not present for this user and day" do
		visit users_calendar_events_path

		expect(page).to have_text("You have not events for this day")
	end
end
