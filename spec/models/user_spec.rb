require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:email) }
  it { should respond_to(:fullname) }
  it { should have_many(:calendar_events) }
end
