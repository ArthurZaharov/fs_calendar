module Features
  module UserHelpers
    def edit_user_profile_with(fullname, email, new_password, current_password)
      visit edit_user_registration_path
      fill_in 'Fullname', with: fullname
      fill_in 'Email', with: email
      fill_in 'Password', with: new_password
      fill_in 'Password confirmation', with: new_password
      fill_in 'Current password', with: current_password
      click_button 'Update'
    end
  end
end
