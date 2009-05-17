class CreateShackmates < ActiveRecord::Migration
  def self.up
    create_table :shackmates do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :level
      t.timestamps
    end
  end
  
  def self.down
    drop_table :shackmates
  end
end
