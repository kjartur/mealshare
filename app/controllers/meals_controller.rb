class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def index
    # temp_meals = []
    # Meal.all.each do |meal|
    #   if meal.user_id == current_user.id
    #     temp_meals << meal
    #   end
    # end

    @meals = Meal.where(user: current_user)

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

  private

  def review_params
    params.require(:meal).permit(:date, :time, :topic, :meal_type, :seats, :title, :address, :city, :post_code)
  end
end
