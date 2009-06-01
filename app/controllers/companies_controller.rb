class CompaniesController < BaseController
  layout "dashboard"
  
  def index
    @companies = current_account.companies.all()
  end
  
  def new
    @company = Company.new
    
    render 'new', :layout => "dashboard"
  end
  
  def create
    @company = current_account.companies.new(params[:company])
    @company.account_id = current_account.id

    if @company.save
       flash[:notice] = "Successfully created company."
       redirect_to root_path
    else
      render :action => 'new', :layout => "dashboard"
    end
  end
  
end
