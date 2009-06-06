class Todo < ActiveRecord::Base
  belongs_to :todo_list
  
  validates_presence_of :task, :allow_blank => false
  
  named_scope :completed, :conditions => {:completed => true}
  named_scope :uncompleted, :conditions => {:completed => false}
  named_scope :related_to, lambda {|user_id| 
                {:conditions => ["responsible_id = ?",user_id]} unless (user_id.nil? or user_id.blank?)
              }
  
  belongs_to :creator, :class_name => "User"
  belongs_to :responsible, :class_name => "User"
  
  
  
end
