class Document < ActiveRecord::Base
  
  belongs_to :project
  
  has_many :document_versions
  accepts_nested_attributes_for :document_versions
  
end
