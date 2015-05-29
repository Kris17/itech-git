class AddCategoryToMicroposts < ActiveRecord::Migration
  def change
    change_table :microposts do |t|
      t.references :category, index: true
    end
  end
  def down
    change_table :microposts do |t|
      t.remove :category_id
    end
  end
end
