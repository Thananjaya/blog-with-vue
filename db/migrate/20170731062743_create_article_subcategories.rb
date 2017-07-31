class CreateArticleSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_subcategories do |t|
      t.references :article, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
