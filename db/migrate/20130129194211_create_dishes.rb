class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title, :null => false
      t.integer :category_id, :null => false
      t.string :description
      t.string :image
      t.float :price
      t.timestamps
    end
  end
end
