class CreateLabels < ActiveRecord::Migration
  def self.up
    create_table :labels do |t|
      t.integer :project_id
      t.string :bg_color
      t.string :fg_color
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :labels
  end
end
