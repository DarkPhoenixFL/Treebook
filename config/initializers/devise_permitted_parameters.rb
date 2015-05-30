# config/initializers/devise_permitted_parameters.rb
module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
    	u.permit(:first_name, :Last_name, :profile_name, :email, :password, :password_confirmation, :remember_me)
    end
    	
    devise_parameter_sanitizer.for(:account_update)  do |u| 
    	u.permit(:first_name, :Last_name, :profile_name, :email, :password, :password_confirmation, :current_password, :remember_me)
    end

    devise_parameter_sanitizer.for(:sign_in) do |u| 
    	u.permit(:first_name, :Last_name, :profile_name, :email, :password)
	end
  end
end

DeviseController.send :include, DevisePermittedParameters

