class AddPostalcodeToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :post_code, :string
  end
end
