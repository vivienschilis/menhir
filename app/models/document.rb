class Document < ActiveRecord::Base
  
  belongs_to :project
  
  has_many :document_versions, :dependent => :destroy
  accepts_nested_attributes_for :document_versions
  
end
