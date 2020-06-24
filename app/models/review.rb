class Review < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :classifications, dependent: :destroy
  has_many :categories, through: :classifications
  has_many :votes, dependent: :destroy
  validates :title, presence: true, length: { minimum: 15 }
  validates :text, presence: true, length: { minimum: 30 }
end
