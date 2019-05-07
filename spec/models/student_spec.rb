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
  
  # describe "#active_student?" do
  #   it "should be active if attended class within the last 45 days" do
  #     classroom = Classroom.create(name: 'Little Rabbits', age_limit: '2-3', classroom_type: 'gymnastics')
  #     student = Student.create(first_name: 'Bob', last_name: 'Bobson', classroom: classroom)
  #     teacher = Teacher.create(first_name: 'Dylan', last_name: "McCaughin")
  #     attendance = Attendance.new(classroom_id: 1, teacher_id: 1, student_ids: [1])
  #     student.attendances << attendance
  #     
  #     puts(student.attendances)
  #     expect(student.attendances).to be_true
  #     
  #   end
  # end
    

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
