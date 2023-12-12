class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def show
    @exercise = Exercise.find(params[:id])
    if @exercise
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
      render json: { errors: @exercise.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(
      :movement_id,
      :exerciseable_id,
      :exerciseable_type,
      :weight,
      :reps,
      :sets
    )
  end
end
