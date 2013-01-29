class CreateDishesIngredients < ActiveRecord::Migration
  def up
    create_table :dishes_ingredients do |t|
      t.integer :dish_id
      t.integer :ingredient_id
    end
  end

  def down
  end
end
