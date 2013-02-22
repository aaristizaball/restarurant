class ApplicationController < ActionController::Base
  protect_from_forgery

  def facebook_logout
      token = session[:fb_token]
      sign_out current_user
      session[:fb_token] = nil
      redirect_to "https://www.facebook.com/logout.php?next=http://localhost:3001&access_token=#{token}"
  end
  
end
