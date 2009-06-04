class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :company_id
      t.timestamps
    end
    
    add_column :projects, :account_id, :integer
    add_column :users, :account_id, :integer
    add_column :companies, :account_id, :integer
    
  end

  def self.down
    drop_table :accounts
    remove_column :projects, :account_id
    remove_column :users, :account_id
    remove_column :companies, :account_id
  end
end
