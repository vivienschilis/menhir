class AddCompleteOnTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :completed, :boolean
  end

  def self.down
    remove_column :todos, :completed, :boolean
  end
end
