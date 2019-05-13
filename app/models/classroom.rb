class Classroom < ApplicationRecord
  # validate :upper_age_limit_a_number
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
  
  def upper_age_limit_a_number
    if upper_age_limit.zero?
      errors.add(:age_limit, "Please enter valid age limit that includes numbers, ie 6-10 or 18+")
    end
  end
end
