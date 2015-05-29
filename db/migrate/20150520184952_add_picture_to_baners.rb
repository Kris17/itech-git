class AddPictureToBaners < ActiveRecord::Migration
  def change
    add_column :baners, :picture, :string
  end
end
