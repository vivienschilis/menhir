class User < ActiveRecord::Base
    
  acts_as_authentic do |c|
     c.validates_length_of_login_field_options     = {:minimum => 2}
     c.validates_format_of_login_field_options     = {:with => /^[a-z0-9_]+/}
     c.validates_format_of_email_field_options     = {:with => /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/i}
     c.validates_length_of_password_field_options  = {:minimum => 4}
   end
   
  has_many :shackmates
  has_many :projects, :through => :shackmates
  
end
