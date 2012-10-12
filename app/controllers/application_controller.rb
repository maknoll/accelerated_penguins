class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate
    authenticate_or_request_with_http_digest do |email|
      User.find_by_email(email).try :password_digest
    end
  end

end
