class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates :name, presence: true, uniqueness: true
  validates :order, presence: true

  def referred_name
    self[:name].underscore
  end

end
