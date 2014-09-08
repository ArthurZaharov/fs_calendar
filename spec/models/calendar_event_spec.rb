require 'rails_helper'

RSpec.describe CalendarEvent, :type => :model do
	let(:calendar_event) { build(:calendar_event) }

	it { should respond_to(:title) }
	it { should respond_to(:date) }
end
