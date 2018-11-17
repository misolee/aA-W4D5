class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false 
      t.string :title, null: false 
      t.text :body 
      t.date :goal_date 
      t.string :privacy
      t.timestamps
    end
    add_index :goals, :user_id
    add_index :goals, :goal_date
  end
end
