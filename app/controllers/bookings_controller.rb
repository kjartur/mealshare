class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @user = current_user
    @meal = Meal.find(params[:meal_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @meal = Meal.find(params[:meal_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.meal = @meal
    if @booking.save
      redirect_to meal_bookings_path(@meal)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seats)
  end
end

