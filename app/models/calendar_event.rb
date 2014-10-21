class CalendarEvent < ActiveRecord::Base
  belongs_to :user
  validates :title, :date, :repeat, presence: true
  validates :repeat, inclusion: { in: %w(once daily weekly monthly yearly) }

  default_scope { order('date::time') }

  def self.all_events_for(date)
    where('date <= ?', "#{date.end_of_day}").select do |calendar_event|
      event_type = "#{calendar_event.repeat.camelize}Event".constantize
      calendar_event.becomes(event_type).check? date
    end
  end
end
