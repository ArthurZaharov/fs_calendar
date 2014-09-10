module Features
	module SessionHelpers
		def sign_in_with email, password
			visit new_user_session_path
			fill_in "Email", with: email
			fill_in "Password", with: password
			click_button "Sign in"
		end

		def sign_in user
			sign_in_with user.email, user.password
		end

		def sign_up_with email, password, fullname = ''
			visit new_user_registration_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			fill_in 'Password confirmation', with: password
			fill_in 'Fullname', with: fullname
			click_button 'Sign up'
		end

		def sign_up user
			sign_up_with user.email, user.password, user.fullname
		end

		def edit_user_profile_with fullname, email, new_password, current_password
			visit edit_user_registration_path
			fill_in "Fullname", with: fullname
			fill_in "Email", with: email
			fill_in "Password", with: new_password
			fill_in "Password confirmation", with: new_password
			fill_in "Current password", with: current_password
			click_button "Update"
		end

		def edit_event_with title, calendar_event
			visit edit_calendar_event_path(calendar_event)
			fill_in "Title", with: title
			click_button "Save"
		end

		def create_event_with title
			visit new_calendar_event_path
			fill_in "Title", with: title
			click_button "Save"
		end
	end
end