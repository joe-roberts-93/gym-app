class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def show
    @workout = Workout.find(params[:id])
    if @workout
      render json: @workout
    else
      render json: {error: "Workout not found"}
    end
  end

  def create
    @workout = Workout.new(
      datetime: workout_params[:datetime],
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
                                      :datetime,
                                      :gym_id,
                                      :user_id
                                    ])
  end
end
