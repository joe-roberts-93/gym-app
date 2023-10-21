class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(
      first_name: user_params[:first_name],
      surname: user_params[:surname]
    )
    if user.save
      render json: user
    else
      render json: { error: 'Error creating user' }
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: { error: 'User not found' }
    end
  end

  private

  def user_params
    params.require(:user).permit([:first_name, :surname])
  end
end
