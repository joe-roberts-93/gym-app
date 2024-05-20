class RegistrationsController < ApplicationController
  include JwtHelper
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from StandardError, with: :internal_server_error

  def create
    user = User.new(user_params)
    if user.save
      token = encode_token(user_id: user.id)
      render json: { user: user, token: token }, status: :created
    else
    errors = user.errors.to_hash(true).map do |field, messages|
      # Existing logic to customize "email taken" message...
      if field == :password && messages.include?("can't be blank")
        { field: :password, message: "Password is required" }
      elsif field == :password_confirmation && messages.include?("doesn't match Password")
        { field: :password_confirmation, message: "Password confirmation doesn't match" }
      # Add more custom error handling here for other validations...
      else
        { field: field, message: messages.join(", ") }
      end
    end
      render json: { errors: errors }, status: :unprocessable_entity
  end
end 

  private

  def user_params
    params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation)
  end
  def record_invalid(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
