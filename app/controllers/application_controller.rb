class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      decoded_token = JWT.decode(token, ENV['SECRET_KEY'], true, algorithm: 'HS256')

    rescue JWT::DecodeError
      render_unauthorized
    end
  end

  def render_unauthorized
    head :unprocessable_entity
  end
end
