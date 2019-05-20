class Meal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :time, :topic, :meal_type, :seats, presence: true
  validates :meal_type, inclusion: { in: %w( breakfast brunch lunch dinner) }
end
