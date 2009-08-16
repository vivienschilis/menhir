class Project < ActiveRecord::Base
  
  has_many :blogposts, :dependent => :destroy
  
  has_many :images, :dependent => :destroy
  
  has_many :milestones, :dependent => :destroy

  has_many :todo_lists, :dependent => :destroy

  has_many :labels, :dependent => :destroy

  has_many :todos, :through => :todo_lists

  has_many :documents, :dependent => :destroy
  
  has_one :git_repository
  
  belongs_to :user
  
  has_many :collaborators
  has_many :clients
  
  has_many :users, :through  => :collaborators
  has_many :companies, :through  => :clients
  
  belongs_to :account
  
  validates_presence_of :name
  
end
