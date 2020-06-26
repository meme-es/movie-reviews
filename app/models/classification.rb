class Classification < ApplicationRecord
  belongs_to :category
  belongs_to :review
  validates :category_id, uniqueness: { scope: :review_id }
end
