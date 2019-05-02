class Student < ApplicationRecord
  include Nameable
  
  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: [:first_name] } # message: "A student by that name already exists."
  
  belongs_to :classroom
  has_many :student_attendances
  has_many :attendances, through: :student_attendances
  
  # def full_name
  #   self.first_name + ' ' + self.last_name
  # end
  
  # include Slugable
  # 
  # has_many :posts
  # has_many :comments
  # has_many :votes
  # 
  # has_secure_password validations: false
  # 
  # validates :username, presence: true, uniqueness: true
  # validates :password, presence: true, on: :create, length: {minimum: 3}
  # 
  # sluggable_column :username
  # 
  # def admin?
  #   self.role == 'admin'
  # end
  # 
  # def moderator?
  #  self.role == 'moderator'
  # end
end
