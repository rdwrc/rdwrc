class AddCategoryToArticles < ActiveRecord::Migration
  def change
    create_table :articles_categories, :id => false do |t|
      t.references :article, :category
    end
    add_index :articles_categories, [:article_id, :category_id]
  end
end
