class RenameTimeDoneToOn < ActiveRecord::Migration[5.1]
  def change
    rename_column :exercises, :time_done, :on
  end
end
