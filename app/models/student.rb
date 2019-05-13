class Student < ApplicationRecord
  ACTIVE = 45.days.ago

  include Nameable
  
  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: [:first_name] } # message: "A student by that name already exists."
  
  belongs_to :classroom
  has_many :student_attendances
  has_many :attendances, through: :student_attendances
  
  def active_student?
    new_student? || recently_attended?
  end
  
  private
    
  def recently_attended?
    attendances.any? {|a| a.created_at > ACTIVE }
  end
  
  def new_student?
    attendances.empty?
  end
end

