class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # protect_from_forgery with: :exception

  # before_action :update_allowed_parameters, if: :devise_controller?

  # protected

  # def update_allowed_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password, :role) }
  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:name, :photo, :bio, :email, :password, :current_password, :role)
  #   end
  # end

  # # Catch all CanCan errors and alert the user of the exception
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, alert: exception.message
  # end
end
