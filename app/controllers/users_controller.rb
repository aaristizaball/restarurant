class UsersController < ActionController::Base
  
  def show
    graph = Koala::Facebook::GraphAPI.new(session[:fb_token])
    @user = User.find(params[:id])
    @image = graph.get_picture(@user.uid, :type => 'large')
    @friends = graph.get_connections("me", "friends")
    #graph.put_wall_post("hola", :picture => "http://somalilandpress.com/wp-content/uploads/2010/05/coca-cola2.jpg")
    
  end

end
