class CalendarEvent < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :date, presence: true
	validates :repeat, presence: true
end
