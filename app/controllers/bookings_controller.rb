class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @user = current_user
    @meals = Meal.find(params[:meal_id])
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

end
