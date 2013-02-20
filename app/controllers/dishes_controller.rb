class DishesController < ApplicationController
  #before_filter :authenticate_user!
  
  def index
    category_id = params[:category_id] ? params[:category_id] : 1
    page = params[:page] ? params[:page] : 1
    @category = Category.find(category_id)
    @dishes = @category.dishes.page(page)
    
    @categories = Category.all
  end
  
  def show
    @dish = Dish.find(params[:id])
    @categories = Category.all
    user = current_user
    
    initialize_votes

    
  end
  
  def vote
    @dish = Dish.find(params[:dish_id])
    user = current_user
    @vote = params[:vote]
    @dish.vote :voter => user, :vote => @vote
    
     initialize_votes
  end
  
  :private
  
  
  def initialize_votes
    if user_signed_in?
      user = current_user
      @vote = (user.voted_as_when_voted_for @dish) ? "dislike" : "like"
      @total_votes = @dish.likes.size
    end
  end 
end
