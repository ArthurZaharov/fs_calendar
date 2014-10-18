require 'rails_helper'

feature 'Users sign in', type: :feature do
  let(:user) { create(:user) }

  scenario 'fail with blank email' do
    sign_in_with '', user.password

    expect(page).to have_text('Invalid email or password')
  end

  scenario 'fail with wrong email' do
    sign_in_with 'blabla@example.com', user.password

    expect(page).to have_text('Invalid email or password')
  end

  scenario 'fail with blank password' do
    sign_in_with user.email, ''

    expect(page).to have_text('Invalid email or password')
  end

  scenario 'fail with wrong password' do
    sign_in_with user.email, 'somewrongpassword'

    expect(page).to have_text('Invalid email or password')
  end

  scenario 'success with valid information' do
    sign_in user

    expect(page).to have_text('Signed in successfully')
  end
end
