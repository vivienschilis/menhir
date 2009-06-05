class AccountsController < ApplicationController
    
  def new
    @account = Account.new
    @account.build_user
    @account.build_company
    
    render :layout => "signup"
    
  end
  
  def create
    Account.transaction do
      User.transaction do
        @account = Account.new(params[:account])
        @account.subdomain = params[:account][:company_attributes][:name]
        
        if @account.save
          user = @account.user
          user.account_id = @account.id
          user.company_id = @account.company_id
          user.save
  
          flash[:notice] = "Successfully created account."
          redirect_to login_path
  
        else
          render :action => 'new', :layout => "signup"
        end
      end
    end
  end
  
end
