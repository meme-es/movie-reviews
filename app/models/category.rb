class Category < ApplicationRecord
  has_many :classifications, dependent: :destroy
  has_many :reviews, through: :classifications
  validates :name, presence: true, length: { in: 5..30 }, uniqueness: true

  before_validation :strip, only: [:name]

  scope :by_priority, -> { order(priority: :desc) }
  # below should be improved to take just the recent review
  scope :four_most, -> { order(priority: :desc).includes(:reviews).take(4) }

  private

  def strip
    self.name = name.strip unless name.nil?
  end
end
