class CreateBlogcoms < ActiveRecord::Migration
  def self.up
    create_table :blogcoms do |t|
      t.string :poster
      t.string :website
      t.integer :blogpost_id
      t.text :content
      t.integer :public_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :blogcoms
  end
end
