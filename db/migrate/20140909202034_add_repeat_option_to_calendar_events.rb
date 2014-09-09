class AddRepeatOptionToCalendarEvents < ActiveRecord::Migration
  def change
    add_column :calendar_events, :repeat, :string
  end
end
