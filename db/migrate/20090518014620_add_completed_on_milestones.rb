class AddCompletedOnMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :completed, :boolean, :default => false
  end

  def self.down
    remove_column :milestones, :completed
  end
end
