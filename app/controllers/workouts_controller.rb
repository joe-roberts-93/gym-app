class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def show
    @workout = Workout.find(params[:id])
    if @workout
      render json: @workout, include: {exercises: {include: :movement}}
    else
      render json: {error: "Workout not found"}
    end
  end

  def create
    @workout = Workout.new(
      date: workout_params[:date],
      time: workout_params[:time],
      notes: workout_params[:notes],
      gym_id: workout_params[:gym_id],
      user_id: workout_params[:user_id]
    )
    if @workout.save
      render json: @workout
    else
      render json: { error: 'Workout not saved' }
    end
  end

  private

  def workout_params
    params.require(:workout).permit([
                                      :date,
                                      :time,
                                      :gym_id,
                                      :user_id,
                                      :notes
                                    ])
  end
end
