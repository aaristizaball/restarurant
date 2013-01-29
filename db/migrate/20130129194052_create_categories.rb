class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, :null => false
      t.integer :position

      t.timestamps
    end
  end
end
