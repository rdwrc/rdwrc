class CreateFileTable < ActiveRecord::Migration
  def change
    create_table :original_files do |t|
      t.integer :article_id
      t.attachment :file
      t.timestamps
    end

    add_index :original_files, :article_id
  end
end
