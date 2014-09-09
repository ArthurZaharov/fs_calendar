require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do
	let(:calendar_event) { build(:calendar_event) }

	it { should respond_to(:title) }
	it { should respond_to(:date) }
	it { should belong_to(:user) }

	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:date) }
	it { should validate_presence_of(:repeat) }
end
