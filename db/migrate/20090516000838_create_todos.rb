class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.integer :todo_list_id
      t.integer :progression
      t.integer :milestone_id
      t.string :task
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :todos
  end
end
