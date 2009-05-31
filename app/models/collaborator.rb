class Collaborator < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates_uniqueness_of :user_id, :scope => :project_id
  
  validates_presence_of :user_id
  validates_presence_of :project_id
  
  
  def before_destroy
    false if project.user == user
  end
end
