class GymsController < ApplicationController

  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    gym = Gym.find(params[:id])
    if gym
      render json: gym
    else
      render json: { error: 'Gym not found' }
    end
  end
end
