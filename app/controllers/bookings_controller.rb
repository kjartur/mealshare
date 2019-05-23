class BookingsController < ApplicationController

  def index
    @meals = Meal.where(user: current_user)
    @bookings = current_user.bookings
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
      redirect_to bookings_path(@meal)
    else
      render :new
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:seats)
  end

  def confirm
    @user = current_user
    @meal = Meal.find(params[:meal_id])
    @booking = Booking.new(booking_params) # GET THE POST parameters
    render :new if @booking.invalid? # Return if false
  end
end
