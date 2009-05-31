class CreateCollaborators < ActiveRecord::Migration
  def self.up
    create_table :collaborators do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :level
      t.timestamps
    end
  end

  def self.down
    drop_table :collaborators
  end
end
