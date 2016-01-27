class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def is_admin
  
  end
  
  protected 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation,) }
    #rates_parameter_sanitizer.for(:create) {|u| u.permit(:rate_id,:rateable_id,:rateable_type,:stars,:dimension,:review_by_rater)}
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    
    if Role.find(current_user.role_id).name == "ADMIN"
    	stored_location_for(resource) || admin_dashboard_index_path
    elsif Role.find(current_user.role_id).name == "USER"
    	stored_location_for(resource) || shops_index_path
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  private 

  def check_admin
      if current_user.role_id != 1
         redirect_to shops_index_path
     
      end
  end
 
end
