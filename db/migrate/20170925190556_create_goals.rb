class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.belongs_to :user, foreign_key: true
      t.string :type
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
