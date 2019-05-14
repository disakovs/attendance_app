require 'rails_helper'
require 'spec_helper'

RSpec.describe Attendance do
  it { should belong_to(:teacher)}
  it { should belong_to(:classroom)}
  it { should have_many(:students)}
end
