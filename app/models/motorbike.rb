class Motorbike < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true
end
