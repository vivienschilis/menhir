class UsersController < ApplicationController
  layout "dashboard"
  
  before_filter :login_required,  :only => [ :index ]

  before_filter :select_company

  def select_company
    @company = Company.find(params[:company_id])
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = @company.users.new
  end
  
  def create
    @user = @company.users.new(params[:user])
    @user.account_id = current_account.id
    if @user.save
      flash[:notice] = "Successfully Registred."
      redirect_to [@company,@user]
    else
      render :action => 'new', :layout => "signup"
    end
  end
  
  def edit
    @user = @company.users.find(params[:id])    
    unless @user == current_user
      flash[:error] = "You have no acces to this part"
      redirect_back_or_default root_url
    end
  end
  
  def update
    @user = @company.users.find(params[:id])
    if @user == current_user && @user.update_attributes(params[:user]) 
      flash[:notice] = "Successfully updated user."
      redirect_to [@company,@user]
    else
      flash[:error] = "Errors occurred during the update"
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to company_users_url(@company)
  end
end
