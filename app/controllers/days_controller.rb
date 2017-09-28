class DaysController < ApplicationController
  def index
  end

  def show
    @date = Date.parse(params[:date])
    @exercises = Exercise.where(time_done: @date.midnight..@date.end_of_day)
    @diets = Diet.where(meal_time: @date.midnight..@date.end_of_day)
    @goals = Goal.where(due_date: @date.midnight..@date.end_of_day)
    @user = current_user
  end
end
