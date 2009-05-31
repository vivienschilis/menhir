class CreateDocumentVersions < ActiveRecord::Migration
  def self.up
    create_table :document_versions do |t|
        t.integer :document_id
        t.integer :version_id
        t.string  :version_file_name
        t.string  :version_content_type
        t.integer :version_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :document_versions
  end
end
