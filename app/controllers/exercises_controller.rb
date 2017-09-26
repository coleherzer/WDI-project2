class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    #probably won't need this
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new
    @exercise.name_of_exercise = params[:exercise][:name_of_exercise]
    @exercise.duration = params[:exercise][:duration]
    @exercise.distance = params[:exercise][:distance]
    @exercise.repititions = params[:exercise][:repititions]
    @exercise.exercise_category = params[:exercise][:exercise_category]
    @exercise.calories_burned = params[:exercise][:calories_burned]
    @user = current_user
    @exercise.user = @user
    # Need to go in and create the log in/out sessions aspect of the app
    # and then come back to the above two lines to reference
    # current_user and assign the exercise to the current user
    if @exercise.save
      redirect_to user_path(@user)
    else
      redirect_to new_exercise_path
    end
  end

  def edit
    # @exercise = current_user.exercises.find(params[:id])
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    @user = current_user
    if @exercise.update(exercise_params)
      redirect_to user_path(@user)
    else 
      redirect_to edit_exercise_path
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @user = current_user
    if @exercise.destroy 
      redirect_to user_path(@user)
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name_of_exercise, :exercise_category, :duration, :distance, :repititions, :calories_burned)
  end
end
