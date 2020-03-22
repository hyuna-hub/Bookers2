class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user
    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
  before_action :correct_user, only: [:edit, :update]

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
