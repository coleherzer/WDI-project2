class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      # is customizing the cookie with that user's id 
      redirect_to user_path(@user)
    else 
      flash[:danger] = "Incorrect email or password"
      #flash messages are alerts that only show up on one request
      redirect_to new_session_path
    end    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
