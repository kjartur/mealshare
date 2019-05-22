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

  def my_bookings
    # @bookings = Bookings.where()
  end

  private

  def review_params
    params.require(:booking).permit(:content)
  end
end
