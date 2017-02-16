class Review < ApplicationRecord
  belongs_to :rental

  validates :content, presence: true
  validates :rate, :inclusion => { :in => 0..5 }, numericality: { only_integer: true }
end
