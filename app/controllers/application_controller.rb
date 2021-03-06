class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_account
    @current_account ||= Account.find session[:current_account]
  end
  helper_method :current_account
end
