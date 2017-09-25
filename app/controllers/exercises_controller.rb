class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    #probably won't need this
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
