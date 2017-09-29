class DietsController < ApplicationController
  def index
  end

  def show
    @diet = Diet.find(params[:id])
  end

  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new
    @diet.meal_name = params[:diet][:meal_name]
    @diet.calories = params[:diet][:calories]
    @diet.healthy = params[:diet][:healthy]
    @diet.description = params[:diet][:description]
    @diet.on = params[:diet][:on]
    @user = current_user
    @diet.user = @user
    if @diet.save
      redirect_to user_path(@user)
    else
      redirect_to new_diet_path
    end
  end

  def edit
    @diet = Diet.find(params[:id])
    @user = current_user
  end

  def update
    @diet = Diet.find(params[:id])
    @user = current_user
    if @diet.update(diet_params)
      redirect_to user_path(@user)
    else 
      redirect_to edit_diet_path
    end
  end

  def destroy
    @diet = Diet.find(params[:id])
    @user = current_user
    if @diet.destroy 
      redirect_to user_path(@user)
    end
  end

  private
  def diet_params
    params.require(:diet).permit(:meal_name, :calories, :description, :healthy, :on)
  end
end
