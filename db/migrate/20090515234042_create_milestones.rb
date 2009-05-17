class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.datetime :date
      t.timestamps
    end
  end
  
  def self.down
    drop_table :milestones
  end
end
