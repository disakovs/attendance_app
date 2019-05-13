require 'rails_helper'
require 'spec_helper'

RSpec.describe Classroom do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:age_limit)}
  it { should validate_uniqueness_of(:name)}
  it { should have_many(:students)}
  it { should have_many(:attendances)}
  
  
  describe "#upper_age_limit" do
    let (:classroom1) {Classroom.create(name: 'Little Kangaroos', age_limit: '4-5', classroom_type: 'gymnastics')}
    let (:classroom2) {Classroom.create(name: 'Little Rabbits', age_limit: '18+', classroom_type: 'gymnastics')}
    
    it "returns a number" do
      expect(classroom1.upper_age_limit).to be_an(Integer)
      expect(classroom2.upper_age_limit).to be_an(Integer)
    end
    
    it "returns a number at the higher end of the limit" do
      expect(classroom1.upper_age_limit).to eq(5)
      expect(classroom2.upper_age_limit).to eq(18)
    end
  end
end
