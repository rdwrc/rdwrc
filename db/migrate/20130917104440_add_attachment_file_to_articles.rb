class AddAttachmentFileToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :articles, :file
  end
end
