class BookingsController < ApplicationController

  def index
    @bookings = bookings.all
  end

  def create
    @meals = Meal.find(params[:meal_id])
    @booking = Booking.new(booking_params)
    @booking.meal = @meal
    if @booking.save
      redirect_to meal_path(@meal)
    else
      @review = Review.new
      render "meals/show"
  end
end
