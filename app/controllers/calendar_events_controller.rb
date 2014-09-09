class CalendarEventsController < ApplicationController

	def index
		
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
end
