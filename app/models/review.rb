class Review < ApplicationRecord
  belongs_to :author, class_name: :User
  validates :title, presence: true, length: { minimum: 15 }
  validates :text, presence: true, length: { minimum: 50 }
end
