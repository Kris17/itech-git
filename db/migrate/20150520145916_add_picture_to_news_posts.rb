class AddPictureToNewsPosts < ActiveRecord::Migration
  def change
    add_column :news_posts, :picture, :string
  end
end
