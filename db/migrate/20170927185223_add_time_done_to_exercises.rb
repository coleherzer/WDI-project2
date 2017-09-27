class AddTimeDoneToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :time_done, :datetime
  end
end
