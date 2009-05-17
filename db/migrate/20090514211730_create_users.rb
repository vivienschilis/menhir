class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      
      t.string :full_name
      t.string :trigram
      t.string :phone
      t.string :description
      t.string :portfolio_title
      t.integer :image_id
      t.string :resume
      t.integer :is_admin
      t.datetime :created_at
      t.string :address_town, :address_street, :address_zip, :address_country
      
      t.timestamps
      
    end
  end

  def self.down
    drop_table :users
  end
end
