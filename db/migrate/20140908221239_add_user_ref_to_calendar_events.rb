class AddUserRefToCalendarEvents < ActiveRecord::Migration
  def change
    add_reference :calendar_events, :user, index: true
  end
end
