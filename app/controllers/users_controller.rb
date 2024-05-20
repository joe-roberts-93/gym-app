class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: @user
    else
      render json: { error: 'Error creating user' }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, include: { workouts: { include: [{ exercises: { include: :movement } }, :gym] } }
    else
      render json: { error: 'User not found' }
    end
  end

  def find_by_email
    @user = User.find_by(email: params[:email])
    if @user
      # render json: @user, include: { workouts: { include: [{ exerciseable: { include: :movement } }, :gym] } }
      # rewrite this to use the new polymorphic association
      render json: @user, include: { workouts: { include: [{ exercises: { polymorphic: true, include: :movement } }, :gym] }}
      #  Q. Why is this not working?
    else
      render json: { error: 'User not found' }
    end
  end

  def top_lifters
    @top_lifters = User.top_lifters_last_week.limit(50)
    Rails.logger.info "Reached the top_lifters action"
    Rails.logger.info @top_lifters.inspect
    html = "<h1>Top 50 Lifters (Last 7 Days)</h1>
    <table class='table'>
      <thead>
        <tr>
          <th>Rank</th>
          <th>Name</th>
          <th>Total Weight Lifted</th>
        </tr>
      </thead>
      <tbody>"

    @top_lifters.each_with_index do |user, index|
      html << "<tr>
        <td>#{index + 1}</td>
        <td>#{user.first_name} #{user.surname}</td>
        <td>#{user.total_weight} kg</td>
      </tr>"
    end

    html << "</tbody>
    </table>"

    render html: html.html_safe
  end

  private

  def user_params
    params.require(:user).permit([:first_name, :surname, :email])
  end
end
