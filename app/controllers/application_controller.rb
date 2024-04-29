class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      JWT.decode(
        token.sub(/^Bearer\s+/, ''), ENV['SECRET_KEY'], true, algorithm: 'HS256'
      )
    rescue JWT::DecodeError
      head :unprocessable_entity
    end
  end
end
