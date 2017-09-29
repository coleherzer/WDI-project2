class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :match_user
  # want to be able to use these in your views templates


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #return current user or set to this if there isnt a current user
  end

  def logged_in?
    !!current_user
  end
  #take current user and give you a true or false

  def authorize 
    unless logged_in?
      flash[:danger] = "You must be logged in to view that... Please log in."
      redirect_to new_session_path unless logged_in?
    end
  end
  #make it so that a user can't access certain content unless they be logged in

  def match_user 
    unless current_user.id == params[:id].to_i
      flash[:danger] = "That user's information is private..."
      redirect_to user_path(current_user)
    end
  end
  #make it so that a user can't access certain content unless they be logged in
end
