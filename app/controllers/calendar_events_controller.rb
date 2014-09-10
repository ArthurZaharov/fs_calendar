class CalendarEventsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_events_date, only: [:index, :by_user]

	def index
		@calendar_events = CalendarEvent.all_events_for @events_date
	end

	def by_user
		@calendar_events = CalendarEvent.events_for current_user, @events_date
	end

	def new
		@calendar_event = CalendarEvent.new
	end

	def create
		@calendar_event = CalendarEvent.new(calendar_event_params)
		@calendar_event.user = current_user
		if @calendar_event.save
			redirect_to calendar_events_path, notice: "You successfully create new event"
		else
			render :new
		end
	end

	private

		def calendar_event_params
			params.require(:calendar_event).permit(:title, :date, :repeat)
		end

		def set_events_date
			@events_date = params[:for_date] ? Date.parse(params[:for_date]) : Time.now.in_time_zone('UTC')
		end
end
