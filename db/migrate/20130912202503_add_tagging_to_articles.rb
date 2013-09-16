class AddTaggingToArticles < ActiveRecord::Migration
  def change
    create_table :articles_taggings, :id => false do |t|
      t.references :article, :tagging
    end
    add_index :articles_taggings, [:article_id, :tagging_id]
  end
end
