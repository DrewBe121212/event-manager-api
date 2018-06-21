class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :username, presence: true, length: {minimum: 2}, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 5}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :active, presence: true, inclusion: { in: [ true, false ] }

  validates_format_of :username, :with => /\A(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/
  validates_format_of :email, :with => /\A\S+@\S+\.{1}\S+\z/
  
  has_secure_password
end
