class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_params_access, if: :devise_controller?

  protected

  def update_params_access
    devise_param_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :posts_counter, :surname, :email, :password, :password_confirmation)
    end

    devise_param_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :surname, :email, :password, :current_password)
    end
  end
end
