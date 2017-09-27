class AddMealTimeToDiets < ActiveRecord::Migration[5.1]
  def change
    add_column :diets, :meal_time, :datetime
  end
end
