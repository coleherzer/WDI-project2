class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name_of_exercise
      t.integer :duration
      t.integer :distance
      t.integer :repititions
      t.string :type
      t.integer :calories_burned
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
