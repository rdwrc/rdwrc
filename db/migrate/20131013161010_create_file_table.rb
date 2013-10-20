class CreateFileTable < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :article_id
      t.attachment :asset
      t.attachment :text
      t.timestamps
    end

    add_index :uploads, :article_id
  end
end
