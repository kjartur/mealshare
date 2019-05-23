class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  validates :seats, presence: true
end
