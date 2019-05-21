class MealsController < ApplicationController
  def new
    @meal = Meal.new
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

  private

  def review_params
    params.require(:meal).permit(:date, :time, :topic, :meal_type, :seats)
  end
end
