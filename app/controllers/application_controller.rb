require 'jwt'
class ApplicationController < ActionController::API
  before_action :authenticate_request, except: [:login, :create]

  private
  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    begin
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      @current_user_id = decoded_token.first['user_id']
      @current_user = User.find(@current_user_id)
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
    logger.info "Current user id: #{@current_user_id}"
  end
end
