class Attendance < ApplicationRecord
  belongs_to :teacher
  belongs_to :classroom
  
  has_many :student_attendances
  has_many :students, through: :student_attendances
end
