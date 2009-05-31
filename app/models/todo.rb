class Todo < ActiveRecord::Base
  belongs_to :todo_list
  
  validates_presence_of :task, :allow_blank => false
  
  named_scope :completed, :conditions => {:completed => true}
  named_scope :uncompleted, :conditions => {:completed => false}

  belongs_to :creator, :class_name => "User"
  belongs_to :responsible, :class_name => "User"
  
end
