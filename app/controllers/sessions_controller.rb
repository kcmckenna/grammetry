class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.user_id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
