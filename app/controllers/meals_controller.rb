class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def index
    @meals = Meal.where.not(latitude: nil, longitude: nil)

    @markers = @meals.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude
      }
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(review_params)
    @meal.user_id = current_user.id
    if @meal.save
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
  end

  def search
    if params[:query].present?
      @meals = Meal.near(params[:query], 10)
    else
      @meals = Meal.all
      redirect_to "/"
    end
  end

  def results
    if params[:query].present?
      @meals = Meal.near(params[:query], 10)
    else
      @meals = Meal.all
    end

    @markers = @meals.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude
      }
    end

  end

  private

  def review_params
    params.require(:meal).permit(:date, :time, :topic, :meal_type, :seats, :title, :address, :city, :post_code)
  end
end
