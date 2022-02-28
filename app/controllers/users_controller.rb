class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def register
    @user = User.new
  end

  def post_register
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root
    else
      redirect_to :user_register
    end
  end

  def authorize
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:current_user_id] = @user.id
      redirect_to :posts
    else
      redirect_to :user_login
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
