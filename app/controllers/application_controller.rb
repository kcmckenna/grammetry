class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize
  # I want current user and logged in available in templates for other pages and views

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # return current user or set it to what is found in cookie, only if there is one to begin with
  end

  def current_post
    @current_post ||= Post.find(session[:post_id]) if session[:post_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      flash[:danger] = "You must be logged in to view that."
      redirect_to new_session_path
    end
  end
  # unless session ID the user ID of the "thing", then deny.... then add it to helper
end