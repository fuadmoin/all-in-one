class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:splash_screen]
  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
          u.permit(:fname, :mname, :lname, :email, :password, :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:account_update) do |u|
          u.permit(:fname, :email, :password, :password_confirmation, :current_password)
        end
    end   

    def after_sign_in_path_for(resource)
        categories_path
    end
end
