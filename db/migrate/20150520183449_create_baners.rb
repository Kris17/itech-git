class CreateBaners < ActiveRecord::Migration
  def change
    create_table :baners do |t|
      t.string :name
      t.text :slogan

      t.timestamps null: false
    end
  end
end
