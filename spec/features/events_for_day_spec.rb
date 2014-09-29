require 'rails_helper'

feature "Events", type: :feature do
	let(:user) { create(:user) }

	before(:each) do
		sign_in user
		visit root_path
	end

	scenario "not present for this day", js: true do
		expect(page).to have_text("No events for this day")
	end

	scenario "not present for this user and day", js: true do
		click_button "My events"

		expect(page).to have_text("You have not events for this day")
	end
end
