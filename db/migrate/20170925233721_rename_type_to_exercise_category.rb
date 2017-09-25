class RenameTypeToExerciseCategory < ActiveRecord::Migration[5.1]
  def change
    rename_column :exercises, :type, :exercise_category
  end
end
