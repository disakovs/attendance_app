require 'rails_helper'
require 'spec_helper'

RSpec.describe Teacher do
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should have_many(:attendances)}
end
