class RenameMealTimeToOn < ActiveRecord::Migration[5.1]
  def change
    rename_column :diets, :meal_time, :on
  end
end
