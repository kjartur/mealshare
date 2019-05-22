class Meal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :date, :time, :topic, :meal_type, :title, :address, :city, :post_code, :seats, presence: true
  validates :meal_type, inclusion: { in: %w( Breakfast Lunch Brunch Dinner ) }
end
