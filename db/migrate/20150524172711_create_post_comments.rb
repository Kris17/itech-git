class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :micropost, index: true

      t.timestamps null: false
    end
    add_foreign_key :post_comments, :users
    add_foreign_key :post_comments, :microposts
  end
end
