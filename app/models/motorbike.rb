class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :nullify
  has_many :reviews, through: :rentals, dependent: :nullify
  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true
  # CLOUDINRAY
  has_attachment :photo
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def average_rating
    reviews.average(:rate).to_i
  end
end
