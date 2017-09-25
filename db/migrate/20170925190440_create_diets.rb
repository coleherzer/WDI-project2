class CreateDiets < ActiveRecord::Migration[5.1]
  def change
    create_table :diets do |t|
      t.belongs_to :user, foreign_key: true
      t.string :meal_name
      t.integer :calories
      t.boolean :healthy
      t.string :description

      t.timestamps
    end
  end
end
