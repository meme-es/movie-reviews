class Review < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :classifications
  has_many :categories, through: :classifications
  validates :title, presence: true, length: { minimum: 15 }
  validates :text, presence: true, length: { minimum: 50 }
end
