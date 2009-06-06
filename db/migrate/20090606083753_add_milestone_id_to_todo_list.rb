class AddMilestoneIdToTodoList < ActiveRecord::Migration
  def self.up
    add_column :todo_lists, :milestone_id, :integer
  end

  def self.down
    remove_column :todo_lists, :milestone_id
  end
end
