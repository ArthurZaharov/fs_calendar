require 'rails_helper'

feature 'Users sign up', type: :feature do
  let(:user) { build(:user) }

  scenario 'fail with blank email' do
    sign_up_with '', user.password

    expect(page).to have_text("Email can't be blank")
  end

  scenario 'fail with invalid email' do
    sign_up_with 'invalid_email', user.password

    expect(page).to have_text('Email is invalid')
  end

  scenario 'fail with blank password' do
    sign_up_with user.email, ''

    expect(page).to have_text("Password can't be blank")
  end

  scenario 'fail with short password' do
    sign_up_with user.email, 'foobar'

    expect(page).to have_text('Password is too short')
  end

  scenario 'success with valid information' do
    sign_up_with user.email, user.password

    expect(page).to have_text('Welcome! You have signed up successfully.')
  end

  scenario 'success with fullname' do
    sign_up user

    expect(page).to have_text('Welcome! You have signed up successfully.')
  end
end
