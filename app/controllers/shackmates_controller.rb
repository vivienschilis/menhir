class ShackmatesController < BaseController
  def index
    @shackmates = Shackmate.all
  end
  
  def show
    @shackmate = Shackmate.find(params[:id])
  end
  
  def new
    @shackmate = Shackmate.new
  end
  
  def create
    @shackmate = Shackmate.new(params[:shackmate])
    if @shackmate.save
      flash[:notice] = "Successfully created shackmate."
      redirect_to @shackmate
    else
      render :action => 'new'
    end
  end
  
  def edit
    @shackmate = Shackmate.find(params[:id])
  end
  
  def update
    @shackmate = Shackmate.find(params[:id])
    if @shackmate.update_attributes(params[:shackmate])
      flash[:notice] = "Successfully updated shackmate."
      redirect_to @shackmate
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @shackmate = Shackmate.find(params[:id])
    @shackmate.destroy
    flash[:notice] = "Successfully destroyed shackmate."
    redirect_to shackmates_url
  end
end
