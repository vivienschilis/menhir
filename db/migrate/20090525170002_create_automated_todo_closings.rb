class CreateAutomatedTodoClosings < ActiveRecord::Migration
  def self.up
    create_table :automated_todo_closings do |t|
      t.string :type
      t.text :job
      t.integer :interval
      t.datetime :last_run_at

      t.timestamps
    end
  end

  def self.down
    drop_table :automated_todo_closings
  end
end
