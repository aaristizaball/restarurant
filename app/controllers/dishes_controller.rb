class DishesController < ApplicationController
  #before_filter :authenticate_user!
  
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
    user = current_user
    
   @vote = (user.voted_as_when_voted_for @dish) ? "dislike" : "like"
   @total_votes = (@dish.likes.size - 1) >= 0 ? "A #{@dish.likes.size} clientes les gusta este producto" : ""

    
  end
  
  def vote
    id = 
    @dish = Dish.find(params[:dish_id])
    user = current_user
    @vote = params[:vote]
    @dish.vote :voter => user, :vote => @vote
    
     @vote = (user.voted_as_when_voted_for @dish) ? "dislike" : "like"
     @total_votes = (@dish.likes.size - 1) >= 0 ? "A  #{@dish.likes.size} clientes les gusta este producto" : ""
  end
end
