class AddLabelIdToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :label_id, :integer
  end

  def self.down
    remove_column :todos, :label_id
  end
end
