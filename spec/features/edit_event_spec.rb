require 'rails_helper'

feature 'Edit event', type: :feature do
  let(:user) { create(:user) }
  let(:calendar_event) { create(:calendar_event) }

  before do
    sign_in user
    user.calendar_events << calendar_event
  end

  scenario 'fail with blank title' do
    edit_event_with '', calendar_event

    expect(page).to have_text("Title can't be blank")
  end

  scenario 'success with valid data' do
    edit_event_with 'Some title', calendar_event

    expect(page).to have_text('You successfully edit event')
  end
end
