class PagesController < ApplicationController
  def home
    @meals = Meal.where.not(latitude: nil, longitude: nil)

    @markers = @meals.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude
      }
    end
  end
end
