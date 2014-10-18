module Features
  module CalendarEventHelpers
    def edit_event_with(title, calendar_event)
      visit edit_calendar_event_path(calendar_event)
      fill_in 'Title', with: title
      click_button 'Save'
    end

    def create_event_with(title)
      visit new_calendar_event_path
      fill_in 'Title', with: title
      click_button 'Save'
    end
  end
end
