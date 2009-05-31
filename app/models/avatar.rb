class Avatar < ActiveRecord::Base
  
  has_attached_file :photo,
                    :styles => {:thumb=> "50x50#"},
                    :default_style => :thumb,
                    :url => "/avatar/:id/:style_:basename.:extension"
                    
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  belongs_to :user
end
