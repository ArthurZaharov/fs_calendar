require 'rails_helper'

feature "Other user signed in", type: :feature do
	let(:own_user) { create(:user) }
	let(:user) { create(:user) }
	let(:calendar_event) { create(:calendar_event) }

	before do
		sign_in user
		own_user.calendar_events << calendar_event
	end

	scenario "fail to edit not owned events" do
		visit edit_calendar_event_path(calendar_event)

		expect(page).to have_text('Permission denied')
	end
end