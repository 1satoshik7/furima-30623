class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:date, :nickname, :sur_name, :name, :sur_name_ruby, :name_ruby])
  end
end