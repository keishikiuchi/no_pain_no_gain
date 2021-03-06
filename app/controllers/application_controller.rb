class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller? 

def after_sign_in_path_for(resource)
  	case resource
    when Admin
      admin_top_path
    when User
         user_path(current_user)
  	end
end

def after_sign_out_path_for(resource)

	if resource == :admin
	  new_admin_session_path
	elsif resource == :user
	  root_path
	end
end

private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email,])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
  end

