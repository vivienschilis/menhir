class TodoList < ActiveRecord::Base
  belongs_to :project
  has_many :todos
  
  belongs_to :milestone
  
  validates_presence_of :name
end
