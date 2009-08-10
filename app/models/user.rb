require 'gravtastic'

class User < ActiveRecord::Base
  
  is_gravtastic!
  
  GRAVATAR_SIZE = { :thumb => 50 }
  
  acts_as_authentic do |c|
     c.validates_length_of_login_field_options     = {:minimum => 2}
     c.validates_format_of_login_field_options     = {:with => /^[a-z0-9_]+/}
     c.validates_format_of_email_field_options     = {:with => /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/i}
     c.validates_length_of_password_field_options  = {:minimum => 4}
   end

  validates_uniqueness_of :login;   
  validates_uniqueness_of :email;
  
  validates_presence_of :login
  validates_presence_of :email

#  validates_presence_of :company_id
  
  has_many :collaborators
  has_many :projects, :through => :collaborators
  has_many :project 

  belongs_to :account  
  belongs_to :company
  accepts_nested_attributes_for :company

  has_many :milestones, :through => :projects
  has_many :todo_lists, :through => :projects

  
  def self.find_by_login_or_email(login)
    find_by_login(login) || find_by_email(login)
  end
  
  
  def gravatar(default_size = :thumb)
    
    self.gravatar_url({:rating => 'R', 
                      :secure => true,  
                      :size => GRAVATAR_SIZE[default_size] || GRAVATAR_SIZE[:thumb]})
  
  end
  
  def participate?(project)
    project.collaborators.find_by_user_id(id)
  end
  
  def is_account_owner?
    self.account.user == self
  end
  
  def is_account_user?
    self.company == self.account.company
  end
  
end
