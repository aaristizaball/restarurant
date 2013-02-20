module DishesHelper
  
  def votes_enable(dish)
     if user_signed_in?
        content_tag :div, :class => "votes" do
          content_tag(:div, (link_to @vote.capitalize , "/dishes/vote?dish_id=#{@dish.id}&vote=#{@vote}", :remote => true),  :id => "like")+
          image_tag("others/like_icon.png") +
          content_tag(:p, @total_votes, :id => "total_votes", :class => "icon-thumbs-up")
        end
      else
        content_tag(:p, "Por favor ingrese con su usuario para votar", :class => "total_votes")
      end
  end
end
