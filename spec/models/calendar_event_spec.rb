require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do
  let(:calendar_event) { build(:calendar_event) }

  it { should respond_to(:title) }
  it { should respond_to(:date) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:repeat) }

  describe 'for given date' do
    let!(:once_calendar_event) { create(:calendar_event, date: '2014-09-09 UTC') }
    let!(:daily_calendar_event) { create(:daily_calendar_event, date: '2014-09-08 UTC') }
    let!(:weekly_calendar_event) { create(:weekly_calendar_event, date: '2014-09-07 UTC') }
    let!(:monthly_calendar_event) { create(:monthly_calendar_event, date: '2014-09-06 UTC') }
    let!(:yearly_calendar_event) { create(:yearly_calendar_event, date: '2014-09-05 UTC') }

    it "don't return events" do
      expect(CalendarEvent.all_events_for(Date.parse('2014-08-06 UTC'))).to match_array []
    end

    it 'return yearly and daily events' do
      expect(CalendarEvent.all_events_for(Date.parse('2015-09-05 UTC'))).to match_array [
        daily_calendar_event,
        yearly_calendar_event
      ]
    end

    it 'return monthly and daily events' do
      expect(CalendarEvent.all_events_for(Date.parse('2014-10-06 UTC'))).to match_array [
        daily_calendar_event,
        monthly_calendar_event
      ]
    end

    it 'return weekly and daily events' do
      expect(CalendarEvent.all_events_for(Date.parse('2014-09-14 UTC'))).to match_array [
        daily_calendar_event,
        weekly_calendar_event
      ]
    end

    it 'return once and daily events' do
      expect(CalendarEvent.all_events_for(Date.parse('2014-09-09 UTC'))).to match_array [
        once_calendar_event,
        daily_calendar_event
      ]
    end

    it 'return daily event' do
      expect(CalendarEvent.all_events_for(Date.parse('2014-09-10 UTC'))).to match_array [
        daily_calendar_event
      ]
    end
  end

  describe 'order' do
    let!(:older_calendar_event) { create(:daily_calendar_event, date: '2014-09-09 15:00:00 UTC') }
    let!(:newer_calendar_event) { create(:daily_calendar_event, date: '2014-09-09 5:00:00 UTC') }
    let!(:fresh_calendar_event) { create(:calendar_event, date: '2014-09-10 3:10:00 UTC') }

    it 'is ASC' do
      expect(CalendarEvent.all_events_for(Date.parse('2014-09-10 UTC'))).to eq [
        fresh_calendar_event,
        newer_calendar_event,
        older_calendar_event
      ]
    end
  end
end
