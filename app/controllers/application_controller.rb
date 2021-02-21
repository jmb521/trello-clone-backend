class ApplicationController < ActionController::API
  #skip_before_action :verify_authenticity_token
  helper_method :current_user
  
  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
