class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def show
    @exercise = Exercise.find(params[:id])
    if exercise
      render json: @exercise
    else
      render json: { error: 'Exercise not found' }
    end
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      render json: @exercise
    else
      render json: { error: 'Exercise not created' }
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(
      :movement_id,
      :workout_id,
      :weight,
      :reps,
      :sets
    )
  end
end
