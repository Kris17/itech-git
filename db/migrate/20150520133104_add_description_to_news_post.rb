class AddDescriptionToNewsPost < ActiveRecord::Migration
  def change
    add_column :news_posts, :description, :text
  end
end
