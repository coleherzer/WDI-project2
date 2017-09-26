class GoalsController < ApplicationController
  def index
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
    @user = current_user
  end

  def create
    @goal = Goal.new
    @goal.goal_type = params[:goal][:goal_type]
    @goal.description = params[:goal][:description]
    @goal.completed = params[:goal][:completed]
    @user = current_user
    @goal.user = @user
    if @goal.save
      redirect_to user_path(@user)
    else
      redirect_to new_goal_path
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    @user = current_user
  end

  def update
    @goal = Goal.find(params[:id])
    @user = current_user
    if @goal.update(goal_params)
      redirect_to user_path(@user)
    else 
      redirect_to edit_goal_path
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @user = current_user
    if @goal.destroy 
      redirect_to user_path(@user)
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:goal_type, :description, :completed)
  end
end
