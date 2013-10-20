class AssociateFilesWithArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :file_file_name
    remove_column :articles, :file_content_type
    remove_column :articles, :file_file_size
    remove_column :articles, :file_updated_at

    add_column :articles, :upload_id, :integer
  end

  def down
    add_column :articles, :file_file_name, :string
    add_column :articles, :file_content_type, :string
    add_column :articles, :file_file_size, :integer
    add_column :articles, :file_updated_at, :datetime

    remove_column :articles, :upload_id
  end
end
