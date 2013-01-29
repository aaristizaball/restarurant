class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, :null => false
      t.integer :dish_id, :null => false

      t.timestamps
    end
  end
end
