class ApplicationController < ActionController::Base
  def user_authentication
    if !session[:current_user_id] || !User.find_by(id: session[:current_user_id])
      redirect_to :posts
    end
  end

  def admin_authentication
    if !session[:current_user_id] || !User.find_by(id: session[:current_user_id])&.admin?
      redirect_to :posts
    end
  end
end
