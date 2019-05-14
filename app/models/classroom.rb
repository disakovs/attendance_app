class Classroom < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age_limit, presence: true
  validate :upper_age_limit_a_number

  has_many :students
  has_many :attendances
  
  def upper_age_limit
    n = self.age_limit || '0'
    n.gsub('+', '')[/[\d]+$/].to_i
  end
  
  def active_students
    self.students.select(&:active_student?)
  end
  
  def upper_age_limit_a_number
    if upper_age_limit.zero?
      errors.add(:age_limit, "error.  Please enter valid age limit that includes numbers, ie 6-10 or 18+")
    end
  end
end
