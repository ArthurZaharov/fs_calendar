require 'rails_helper'

feature 'Create new event', type: :feature do
  let(:user) { create(:user) }
  before { sign_in user }

  scenario 'fail with blank title' do
    create_event_with ''

    expect(page).to have_text("Title can't be blank")
  end

  scenario 'success with valid data' do
    create_event_with 'Some title'

    expect(page).to have_text('You successfully create new event')
  end
end
