class Meal < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :date, :time, :topic, :meal_type, :title, :address, :city, :post_code, :seats, presence: true
  validates :meal_type, inclusion: { in: %w( Breakfast Lunch Brunch Dinner ) }
end
