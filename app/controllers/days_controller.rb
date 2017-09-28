class DaysController < ApplicationController
  def index
  end

  def show
    @exercises = Exercise.all
    @exercises.each do |d| 
      @date = d.time_done
    end
      @diets = Diet.all
    @goals = Goal.all
  end
end
