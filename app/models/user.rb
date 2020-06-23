class User < ApplicationRecord
  has_many :reviews, foreign_key: :author_id
  has_many :votes, dependent: :destroy
  validates :name, presence: true, length: { in: 8..30 }, uniqueness: true
end
