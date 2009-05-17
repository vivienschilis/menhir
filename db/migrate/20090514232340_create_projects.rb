class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :link
      t.integer :image_id
      t.integer :is_published
      t.integer :license_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :image_id
      t.string :secret_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
