class Classroom < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age_limit, presence: true
  

  has_many :students
  has_many :attendances
  
  def upper_age_limit
    n = self.age_limit
    n.gsub('+', '')[/[\d]+$/].to_i
  end
  
  def active_students
    self.students.select(&:active_student?)
  end
end
