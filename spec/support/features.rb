RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::UserHelpers, type: :feature
  config.include Features::CalendarEventHelpers, type: :feature
end
