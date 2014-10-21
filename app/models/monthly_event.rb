class MonthlyEvent < CalendarEvent
  def check?(date)
    self.date.strftime('%d') == date.strftime('%d')
  end
end
