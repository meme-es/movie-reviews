class Category < ApplicationRecord
  has_many :classifications
  has_many :reviews, through: :classifications
  validates :name, presence: true, length: { in: 5..30 }, uniqueness: true
end
