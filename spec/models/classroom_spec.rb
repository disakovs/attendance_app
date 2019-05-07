require 'rails_helper'
require 'spec_helper'

RSpec.describe Classroom do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:age_limit)}
  it { should validate_uniqueness_of(:name)}
  
  

  # it "saves itself" do
  #   classroom = Classroom.new(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
  #   classroom.save
  #   expect(Classroom.first.name).to eq('Little Rabbits')
  #   expect(Classroom.first).to eq(classroom)
  # end
  # 
  # it "has many students" do 
  #   classroom = Classroom.create(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
  #   student1 = Student.create(first_name: 'Bob', last_name: 'Bobson', classroom: classroom)
  #   student2 = Student.create(first_name: 'William', last_name: 'Robson', classroom: classroom)
  #   
  #   expect(classroom.students).to include(student1, student2)
  # end
  # 
  # it "does not save classroom without a name" do 
  #   classroom = Classroom.create(age_limit: '2-3', classroom_type: 'gymnastics')
  #   expect(Classroom.count).to eq(0)
  # end
  # 
  # it "does not save withoutn a age_limit" do 
  #   classroom = Classroom.create(name: 'Little Rabbits', classroom_type: 'gymnastics')
  #   expect(Classroom.count).to eq(0)
  # end
  
  describe "#upper_age_limit" do
    it "returns a number" do
      classroom1 = Classroom.create(name: 'Little Kangaroos', age_limit: '4-5', classroom_type: 'gymnastics')
      classroom2 = Classroom.create(name: 'Little Rabbits', age_limit: '18+', classroom_type: 'gymnastics')
      
      expect(classroom1.upper_age_limit).to be_an(Integer)
      expect(classroom2.upper_age_limit).to be_an(Integer)
    end
    
    it "returns a number at the higher end of the limit" do
      classroom1 = Classroom.create(name: 'Little Kangaroos', age_limit: '4-5', classroom_type: 'gymnastics')
      classroom2 = Classroom.create(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
      
      expect(classroom1.upper_age_limit).to eq(5)
      expect(classroom2.upper_age_limit).to eq(3)
    end
  end
end
