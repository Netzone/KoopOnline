class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  #Address and city on registering account
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :city, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :city, :email, :password, :password_confirmation, :current_password])
  end

  protect_from_forgery with: :exception
end
