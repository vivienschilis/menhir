class AddUserAndResponsible < ActiveRecord::Migration
  def self.up
    add_column :todos,:creator_id, :integer, :default => :null
    add_column :todos,:responsible_id, :integer, :default => :null
    add_column :milestones,:creator_id, :integer, :default => :null
    add_column :milestones,:responsible_id, :integer, :default => :null
    add_column :projects, :user_id, :integer, :default => :null
  end

  def self.down
    remove_column :todos,:creator_id
    remove_column :todos,:responsible_id
    remove_column :milestones,:creator_id
    remove_column :milestones,:responsible_id
    remove_column :projects, :user_id

  end
end
