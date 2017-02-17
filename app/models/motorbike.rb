class Motorbike < ApplicationRecord
  CATEGORIES = %w(Road Off-Road Trail Scooter)
  belongs_to :user
  has_many :rentals, dependent: :nullify
  has_many :reviews, through: :rentals, dependent: :nullify
  validates :brand, presence: true
  validates :model, presence: true
  validates :day_price, presence: true
  validates :location, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  # CLOUDINRAY
  has_attachment :photo
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def average_rating
    reviews.average(:rate).to_i
  end
end
