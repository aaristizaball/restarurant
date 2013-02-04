class DishesController < ApplicationController
  
  def index
    category_id = params[:category_id]
    category_id = category_id ? category_id : 1
    @category = Category.find(category_id)
    @dishes = @category ? @category.dishes : Dish.all
    
    @categories = Category.all
  end
  
  def show
    @dish = Dish.find(params[:id])
    @categories = Category.all
  end
end
