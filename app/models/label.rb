class Label < ActiveRecord::Base
  
  validates_uniqueness_of :name, :scope => [:project_id]
  
end
