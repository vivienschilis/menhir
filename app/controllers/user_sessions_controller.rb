class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new  
    render :layout => "signin"
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      flash[:error] = "Login or password is not correct"
      render :action => 'new', :layout => "signin"
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_path
  end
end
