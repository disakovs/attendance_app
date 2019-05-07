class Student < ApplicationRecord
  ACTIVE = 45

  include Nameable
  
  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: [:first_name] } # message: "A student by that name already exists."
  
  belongs_to :classroom
  has_many :student_attendances
  has_many :attendances, through: :student_attendances
  
  
  def active_student?
    self.attendances.any? {|a| a.created_at > ACTIVE.days.ago }
  end 
end
