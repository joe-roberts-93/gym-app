class GoalsController < ApplicationController
  def index
    @goals = Goal.where(user: params[:user_id])
    render json: @goals
  end

  def show
    @goal = Goal.find(params[:id])
    if @goal
      render json: @goal
    else
      render json: { error: 'Goal not found' }
    end
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = User.find(params[:user_id])
    if @goal.save
      render json: @goal
    else
      render json: { error: 'Goal not saved' }
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:exercise_id)
  end
end
