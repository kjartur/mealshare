class BookingsController < ApplicationController

  def index
    @meals = Meal.where(user: current_user)
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
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

        # @booking.seats.save!
        # @meal.seats -= @booking.seats
        # @meal.seats.save!
        redirect_to confirmed_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  def confirm
    # @user = current_user
    # @meal = Meal.find(params[:meal_id])
    # @booking = Booking.new(booking_params) # GET THE POST parameters
    # render :new if @booking.invalid? # Return if false
  end

  private

  def booking_params
    params.require(:booking).permit(:seats)
  end

end
