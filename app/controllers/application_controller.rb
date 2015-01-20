class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?


  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:fname, :lname, :company, :position]
    devise_parameter_sanitizer.for(:account_update) << [:fname, :lname, :company, :position]

  end

  # path after sign in

  def after_sign_in_path_for(resource)
  	new_user_find_path(current_user.id)
	end
  # Send back to root after sign out
  
	def after_sign_out_path_for(resource_or_scope)
    root_path
	end

  

  def signed_in_root_path(resource)
      dashboard_user_path(resource)
    end

    def after_sending_reset_password_instructions_path_for(resource_name)
      reset_path
    end
end
