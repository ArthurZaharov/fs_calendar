class CalendarEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_calendar_event, only: [:edit, :update]
  before_action :check_permission, only: [:edit, :update]

  def index
    @events_date =
      if params[:for_date]
        Date.parse(params[:for_date])
      else
        Time.now.in_time_zone('UTC')
      end
    @calendar_events = CalendarEvent.all_events_for @events_date
  end

  def new
    @calendar_event = CalendarEvent.new
  end

  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)
    @calendar_event.user = current_user
    if @calendar_event.save
      flash[:notice] = 'You successfully create new event'
      redirect_to calendar_events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @calendar_event.update(calendar_event_params)
      flash[:notice] = 'You successfully edit event'
      redirect_to calendar_events_path
    else
      render :edit
    end
  end

  private

  def calendar_event_params
    params.require(:calendar_event).permit(:title, :date, :repeat)
  end

  def find_calendar_event
    @calendar_event = CalendarEvent.find(params[:id])
  end

  def check_permission
    unless @calendar_event.user == current_user
      redirect_to root_path, alert: 'Permission denied'
    end
  end
end
