class Rental < ApplicationRecord
  belongs_to :motorbike
  belongs_to :user
end
