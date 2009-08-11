class Milestone < ActiveRecord::Base
  belongs_to :project
  
  has_many :todo_lists
  
  validates_presence_of :date
  
  belongs_to :creator, :class_name => "User"
  belongs_to :responsible, :class_name => "User"
  
  named_scope :related_to, lambda {|user_id| 
                {:conditions => ["responsible_id = ?",user_id]} unless (user_id.nil? or user_id.blank?)
              }
  
  default_scope :order => "date DESC"
  
  named_scope :completed, :conditions => {:completed => true}
  named_scope :uncompleted, :conditions => {:completed => false}
  
  named_scope :upcoming, :conditions => ["date >= ?", Date.today]
  named_scope :upcoming_soon, :conditions => ["date >= ? AND date <= ? ", Date.today, Date.today + 2.weeks]
  named_scope :late, :conditions => ["date < ?", Date.today]


  def is_late?
    return date < Date.today
  end
  
end
