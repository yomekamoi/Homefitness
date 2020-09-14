class CreatePostsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_categories do |t|
      t.references :category, foreign_key: true, index: true, null: false
      t.references :post, foreign_key: true, index: true, null: false
    end
  end
end
