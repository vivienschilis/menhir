class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :defaut => "", :null => false
      t.string :address_1, :default => "", :null => false
      t.string :address_2, :default => "", :null => false
      t.string :state,  :default => "", :null => false
      t.string :zipcode, :default => "", :null => false
      t.string :phone_office, :default => "", :null => false
      t.string :phone_fax, :default => "", :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
