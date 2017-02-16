class Review < ApplicationRecord
  belongs_to :rental

  validates :content, presence: true
  validates :rate, :inclusion => { :in => 0..5 }, numericality: { only_integer: true }

  def is_owner?
    if current_user == @review.user_id
      @review.user_id = current_user
    else

    end
  end
end
