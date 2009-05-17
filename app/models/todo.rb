class Todo < ActiveRecord::Base
  belongs_to :todo_list
  
  validates_presence_of :task, :allow_blank => false
  
end
