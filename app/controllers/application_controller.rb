class ApplicationController < ActionController::Base
  protect_from_forgery
  attr_reader :current_user

  protected

  def authenticate
    authenticate_or_request_with_http_digest do |email|
      @current_user = User.find_by_email(email)
      @current_user.try :password_digest
    end
  end

end
