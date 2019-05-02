class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :admin?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    unless logged_in?
      redirect_to login_path
    end
  end
  
  def admin?
    logged_in? && current_user.role == 'admin'
  end
  
  def require_admin
    access_denied unless admin?
  end
  
  def access_denied
    flash[:error] = "You do not have access to do that."
    redirect_to root_path
  end
end
