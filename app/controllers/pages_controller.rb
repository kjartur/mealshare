class PagesController < ApplicationController
  def home
    if params[:query].present?

      @meals = Meal.near(params[:query], 10)
    else
      @meals = Meal.where.not(latitude: nil, longitude: nil)
    end
    @markers = @meals.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude
      }
    end
  end
end
