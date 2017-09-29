class RenameDueDateToOn < ActiveRecord::Migration[5.1]
  def change
    rename_column :goals, :due_date, :on
  end
end
