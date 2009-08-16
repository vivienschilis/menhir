class Image < ActiveRecord::Base
  belongs_to :project
  
  has_attached_file :file,
                    :styles => { :original => '500x375>', 
                                 :small => '50x50' },
                    :url => "/:images/:project_id/:id/:style/:basename.:extension",
                    :path => ":rails_root/system/:image/:project_id/:id/:style/:basename.:extension"
                    
  validates_attachment_content_type :file, :content_type => ['image/jpeg','image/png']

  validates_attachment_size :file, :less_than => 2.megabytes
  

  def before_create
    if project.images.count > 5
      return false
    end
    
    return true
  end
    
  end
end
