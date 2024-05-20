# app/helpers/jwt_helper.rb
module JwtHelper
  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end
end
