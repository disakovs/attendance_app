require 'rails_helper'
require 'spec_helper'

RSpec.describe Student do

  it {should belong_to(:classroom)}
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  
  describe "#full_name" do
    it "should be a combination of first and last name" do
      classroom = Classroom.create(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
      student = Student.create(first_name: 'Bob', last_name: 'Bobson', classroom: classroom)
      name = "Bob" + ' ' + 'Bobson'
      
      expect(student.full_name).to eq(name)
    end
  end
  
  describe "#active_student?" do
    let(:classroom) { Classroom.create(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')}
    let(:student) { Student.create(first_name: 'Bob', last_name: 'Bobson', classroom: classroom) }
    let(:teacher) { Teacher.create(first_name: 'Dylan', last_name: "McCaughin") }
    subject { student.active_student? }
    
    it "should be active if have not attended classes yet" do
      expect(subject).to be_truthy
    end
    
    it "should be active if attended class within the last 45 days" do
      student.attendances.create(classroom: classroom, teacher: teacher, created_at: 2.days.ago)
      
      expect(subject).to be_truthy
    end
    
    it "should be inactive if attended class more than 45 days ago" do
      student.attendances.create(classroom_id: 1, teacher_id: 1, created_at: 46.days.ago)
      
      expect(subject).to be_falsey
    end
  end 

  it "saves itself" do
    classroom = Classroom.new(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
    student = Student.new(first_name: 'Bob', last_name: 'Bobson', classroom: classroom)
    student.save
    expect(Student.first).to eq(student)
  end
  
  it "belongs to classroom" do 
    classroom = Classroom.create(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
    student = Student.create(first_name: 'Bob', last_name: 'Bobson', classroom: classroom)
    
    expect(student.classroom).to eq(classroom)
  end
end
