class AuthenticationController < ApplicationController
  include JwtHelper

  def login
    puts "AuthenticationController#login"
    user = User.find_by(email: params[:email])
    puts user
    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
