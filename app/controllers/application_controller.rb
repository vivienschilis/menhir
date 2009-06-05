# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  require 'calendar_grid'
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :current_account

  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_account
    return @current_account if defined?(@current_account)
    @current_account = current_user.account if current_user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def current_project
    @project
  end
  
  
  def login_required
    unless current_user
      flash[:error] = "You must be logged in to access this page"
      redirect_to login_path
      return false
    end
  end

  def logout_required
    if current_user
      flash[:error] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end
  
  def account_ower_required
    if current_user != current_account.user
      flash[:error] = "Should be an account owner"
      redirect_back_or_default root_url
      return false
    end
  end
  
  def account_user_required
    if current_user.company != current_account.company
      flash[:error] = "Should be an account user"
      redirect_back_or_default root_url
      return false
    end
  end
  
  def project_ower_required
    if (current_user != current_project.user) && (current_user != current_account.user)
      flash[:error] = "Should be account owner or account manager"
      redirect_back_or_default root_url
      return false
    end
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
    
  def logged_in?
    current_user != nil
  end

end
