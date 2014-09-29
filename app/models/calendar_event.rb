class CalendarEvent < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :date, presence: true
	validates :repeat, presence: true

	default_scope { order("date::time") }

	def self.all_events_for date
		where('date <= ?', "#{date.end_of_day}").map do |calendar_event|
			calendar_event if check? calendar_event, date
		end.compact
	end

	private

		def self.check? calendar_event, date
			case calendar_event.repeat
			when 'once'
				true if calendar_event.date.between? date.beginning_of_day, date.end_of_day
			when 'daily'
				true
			when 'weekly'
				true if calendar_event.date.strftime("%w") == date.strftime("%w")
			when 'monthly'
				true if calendar_event.date.strftime("%d") == date.strftime("%d")
			when 'yearly'
				true if calendar_event.date.strftime("%d%m") == date.strftime("%d%m")
			end
		end
end
