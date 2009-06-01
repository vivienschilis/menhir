class Company < ActiveRecord::Base
  
  has_many :users

  validates_uniqueness_of :name, :scope => :account_id
  
end
