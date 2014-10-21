class WeeklyEvent < CalendarEvent
  def check?(date)
    self.date.strftime('%w') == date.strftime('%w')
  end
end
