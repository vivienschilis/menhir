class Image < ActiveRecord::Base
  belongs_to :project
  
  has_attached_file :file,
                    :styles => { :original => '500x375>', 
                                 :small => '50x50' },
                    :url => "/:images/:project_id/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/:image/:project_id/:id/:style/:basename.:extension"
                    
  validates_attachment_content_type :file, :content_type => ['image/jpeg','image/png']

  validates_attachment_size :file, :less_than => 2.megabytes
end
