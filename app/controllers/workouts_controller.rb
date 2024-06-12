class WorkoutsController < ApplicationController
  include JwtHelper
  before_action :authenticate_request

  def index
    logger.info @current_user.inspect
    @workouts = @current_user.workouts
    render json: @workouts, include: [exercises: {include: :movement}]
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
    puts @current_user.inspect
    @workout = Workout.new(
      date: workout_params[:date],
      time: workout_params[:time],
      notes: workout_params[:notes],
      gym_id: workout_params[:gym_id],
      user: @current_user
    )
    if @workout.save
      render json: @workout
    else
      render json: { error: 'Workout not saved' }
      puts @workout.errors.full_messages
    end
  end

  private

  def workout_params
    params.require(:workout).permit([
                                      :date,
                                      :time,
                                      :gym_id,
                                      :notes
                                    ])
  end
end
