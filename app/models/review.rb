class Review < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :classifications, dependent: :destroy
  has_many :categories, through: :classifications
  has_many :votes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates :title, presence: true, length: { minimum: 15 }
  validates :text, presence: true, length: { minimum: 30 }
  before_save :check_category

  scope :desc, -> { includes(image_attachment: :blob, author: :reviews, votes: :review).order(created_at: :desc) }

  def check_category
    if category_ids.count.zero?
      errors.add(:base, 'Review must have any category')
      throw(:abort)
    end

    true
  end

  def self.featured
    Review.all.order(created_at: :desc).includes(:votes).includes(image_attachment: :blob).max_by { |review| review.votes.length }
  end
end
