require 'rails_helper'

feature 'Users edit profile', type: :feature do
  let(:user) { create(:user) }
  before { sign_in user }

  scenario 'fail with blank email' do
    edit_user_profile_with user.fullname, '', '', user.password

    expect(page).to have_text("Email can't be blank")
  end

  scenario 'fail with wrong email' do
    edit_user_profile_with user.fullname, 'somewrongemail', '', user.password

    expect(page).to have_text('Email is invalid')
  end

  scenario 'fail with short password' do
    edit_user_profile_with user.fullname, user.email, 'short', user.password

    expect(page).to have_text('Password is too short')
  end

  scenario 'fail with wrong current password' do
    edit_user_profile_with user.fullname, user.email, '', 'wrongcurrentpassword'

    expect(page).to have_text('Current password is invalid')
  end

  scenario 'success with valid information' do
    edit_user_profile_with 'New name', 'email@example.com', '', user.password

    expect(page).to have_text('You updated your account successfully')
  end

  scenario 'success without fullname' do
    edit_user_profile_with '', user.email, '', user.password

    expect(page).to have_text('You updated your account successfully')
  end
end
