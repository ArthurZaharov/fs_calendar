require 'rails_helper'

describe User do
  it { should respond_to(:email) }
  it { should respond_to(:fullname) }
  it { should have_many(:calendar_events) }
end
