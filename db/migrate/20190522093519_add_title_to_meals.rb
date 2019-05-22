class AddTitleToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :title, :string
  end
end
