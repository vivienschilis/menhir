Paperclip.interpolates :document_id do |attachment, style|
  attachment.instance.document_id
end

Paperclip.interpolates :project_id do |attachment, style|
  attachment.instance.document.project_id
end
