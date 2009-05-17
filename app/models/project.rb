class Project < ActiveRecord::Base
  
  has_many :blogposts, :dependent => :destroy
  
  has_many :images, :dependent => :destroy
  
  has_many :milestones, :dependent => :destroy

  has_many :todo_lists, :dependent => :destroy
  
  has_one :image
  
end
