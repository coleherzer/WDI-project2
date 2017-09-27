class AddStartWeightToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :start_weight, :float
  end
end
