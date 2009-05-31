class CreateGitRepositories < ActiveRecord::Migration
  def self.up
    create_table :git_repositories do |t|
      t.integer :project_id
      t.string  :name
      t.timestamps
    end
  end

  def self.down
    drop_table :git_repositories
  end
end
