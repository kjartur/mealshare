class Review < ApplicationRecord
  belongs_to :booking
  validates :review_text, presence: true
end
