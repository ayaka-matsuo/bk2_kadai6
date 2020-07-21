class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
	user_path(resource)
end

def after_sign_up_path_for(resource)
	user_path(resource)
end

Refile.secret_key = '61593e480ddc8a6e65f973998c5dd7571cdfac41cae1b2858b7c3d053cdbac569455f39befa40ba6608f5e819b4f10869ff2cff6220982047737ee341e8abe40'



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

end

