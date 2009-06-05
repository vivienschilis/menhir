class Account < ActiveRecord::Base
  
  has_many :users
  has_many :companies

  has_many :projects
  
  belongs_to :company
  belongs_to :user

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :company
  
  validates_uniqueness_of :subdomain
end
