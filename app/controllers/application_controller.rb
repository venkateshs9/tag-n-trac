class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { 
      |u| u.permit(:first_name, :last_name, :email, :password, :user_type)
    }
  end
end
