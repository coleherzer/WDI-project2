class AddDueDateToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :due_date, :datetime
  end
end
