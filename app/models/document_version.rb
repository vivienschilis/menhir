class DocumentVersion < ActiveRecord::Base
  belongs_to :document

  named_scope :reverse, :order => "created_at DESC"
  
  has_attached_file :version, :url => "/system/project/:project_id/documents/:document_id/:id.:extension"
 
  def preview_document
      "rails.png"
  end
end
