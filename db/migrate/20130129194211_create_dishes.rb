class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title, :null => false
      t.integer :category_id, :null => false
      t.string :image

      t.timestamps
    end
  end
end
