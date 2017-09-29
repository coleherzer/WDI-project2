class DaysController < ApplicationController
  def index
  end

  def show
    @date = Date.parse(params[:date])
    @exercises = Exercise.where(on: @date.midnight..@date.end_of_day)
    @diets = Diet.where(on: @date.midnight..@date.end_of_day)
    @goals = Goal.where(on: @date.midnight..@date.end_of_day)
    @user = current_user
  end
end
