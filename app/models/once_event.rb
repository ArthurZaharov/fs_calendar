class OnceEvent < CalendarEvent
  def check?(date)
    self.date.between? date.beginning_of_day, date.end_of_day
  end
end
