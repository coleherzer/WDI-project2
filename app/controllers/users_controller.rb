class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      flash[:danger] = "Please Check All Fields"
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else 
      redirect_to edit_user_path
    end
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   if @user.destroy 
  #     redirect_to root_path
  #   end
  # end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to root_path
    # delete the user, then clear the sesssion, then redirect
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :height, :weight)
  end
end
