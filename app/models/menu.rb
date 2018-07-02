class Menu < ApplicationRecord
  has_many :children, class_name: "Menu", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Menu"

  validates :title, presence: true, length: {minimum: 2}, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :sort, presence: true, numericality: true
  validates :visible, presence: true, inclusion: { in: [ true, false ] }
  validates :active, presence: true, inclusion: { in: [ true, false ] }
  validates :deleted, presence: true, inclusion: { in: [ true, false ] }

  def self.active
    where({:active => true, :deleted => false})
  end

  def self.sorted(direction=:asc)
    order(:sort => direction)
  end

end
