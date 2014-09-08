class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end
end
