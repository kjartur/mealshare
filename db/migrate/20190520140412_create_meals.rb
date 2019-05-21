class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :meal_type
      t.time :time
      t.date :date
      t.text :topic
      t.integer :seats

      t.timestamps
    end
  end
end
