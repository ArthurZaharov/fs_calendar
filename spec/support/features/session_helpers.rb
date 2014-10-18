module Features
  module SessionHelpers
    def sign_in_with(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end

    def sign_in(user)
      sign_in_with user.email, user.password
    end

    def sign_up_with(email, password, fullname = '')
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      fill_in 'Fullname', with: fullname
      click_button 'Sign up'
    end

    def sign_up(user)
      sign_up_with user.email, user.password, user.fullname
    end
  end
end
