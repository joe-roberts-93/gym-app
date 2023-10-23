class MovementsController < ApplicationController
  def index
    @movements = Movement.all
    render json: @movements
  end

  def show
    @movement = Movement.find(params[:id])
    if @movement
      render json: @movement
    else
      render json: { error: 'Movement not found' }
    end
  end
end
