class AddCityToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :city, :string
  end
end
