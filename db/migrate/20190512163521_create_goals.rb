class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :item
      t.string :priority
      t.boolean :isCompleted

      t.timestamps
    end
  end
end
