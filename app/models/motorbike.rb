class Motorbike < ApplicationRecord
  belongs_to :user
  validates :brand, presence: true
  validates :model, presence: true
  validates :description, presence: true
  # CLOUDINRAY
  has_attachment :photo
end
