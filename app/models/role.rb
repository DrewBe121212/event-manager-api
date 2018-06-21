class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates :name, presence: true, uniqueness: true
  validates :sort, presence: true, numericality: true
  validates :default, presence: true, inclusion: { in: [ true, false ] }
  validates :active, presence: true, inclusion: { in: [ true, false ] }
  validates :deleted, presence: true, inclusion: { in: [ true, false ] }

  def referred_name
    self[:name].underscore
  end

end
