class User < ApplicationRecord
  has_secure_password validations: false
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}
  
  def admin?
    self.role == 'admin'
  end
  
  def teacher?
    self.role == 'teacher'
  end
end
