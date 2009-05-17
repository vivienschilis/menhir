class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :project_id
      t.integer :file
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_size
      t.timestamps
    end
  end
  
  def self.down
    drop_table :images
  end
end
