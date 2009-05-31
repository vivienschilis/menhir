class Client < ActiveRecord::Base
  belongs_to :project
  belongs_to :company
  
  validates_uniqueness_of :company_id, :scope => :project_id
  
  validates_presence_of :company_id
  validates_presence_of :project_id
  
end
