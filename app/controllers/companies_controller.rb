class CompaniesController < BaseController
  layout "dashboard"
  
  def index
    @companies = current_account.companies.all()
  end
  
  def new
    @company = Company.new
    
    render 'new', :layout => "dashboard"
  end
  
  def edit
    @company = Company.find(params[:id])
  end
  
  def create
    @company = current_account.companies.new(params[:company])
    @company.account_id = current_account.id

    if @company.save
       flash[:notice] = "Successfully created company."
       redirect_to companies_path
    else
      render :action => 'new', :layout => "dashboard"
    end
  end
  
  def update
    @company =  Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = "Successfully updated company."
      redirect_to companies_url
    else
      render :action => 'edit'
    end
  end
    
end
