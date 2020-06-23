class User < ApplicationRecord
  has_many :reviews, foreign_key: :author_id
  validates :name, presence: true, length: { in: 8..30 }, uniqueness: true
end
