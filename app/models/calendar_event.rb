class CalendarEvent < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :date, presence: true
	validates :repeat, presence: true

	default_scope { order("date::time") }

	def self.get_all_events_for_date date
		all_events_for_date = []
		all.each do |calendar_event|
			all_events_for_date <<
				case calendar_event.repeat
				when 'once'
					calendar_event if calendar_event.date.between? date.beginning_of_day, date.end_of_day
				when 'daily'
					calendar_event if calendar_event.date <= date.end_of_day
				when 'weekly'
					calendar_event if calendar_event.date <= date.end_of_day && calendar_event.date.strftime("%w") == date.strftime("%w")
				when 'monthly'
					calendar_event if calendar_event.date <= date.end_of_day && calendar_event.date.strftime("%d") == date.strftime("%d")
				when 'yearly'
					calendar_event if calendar_event.date <= date.end_of_day && calendar_event.date.strftime("%d%m") == date.strftime("%d%m")
				end
		end
		all_events_for_date.compact
	end
end
