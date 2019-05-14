class Teacher < ApplicationRecord
  include Nameable 

  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :attendances
end
