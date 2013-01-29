class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :title, :null => false

      t.timestamps
    end
  end
end
