class YearlyEvent < CalendarEvent
  def check?(date)
    self.date.strftime('%d%m') == date.strftime('%d%m')
  end
end
