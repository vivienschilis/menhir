require File.dirname(__FILE__) + '/../spec_helper'
 
describe FileVersionsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => FileVersion.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    FileVersion.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    FileVersion.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(file_version_url(assigns[:file_version]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => FileVersion.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    FileVersion.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FileVersion.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    FileVersion.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FileVersion.first
    response.should redirect_to(file_version_url(assigns[:file_version]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    file_version = FileVersion.first
    delete :destroy, :id => file_version
    response.should redirect_to(file_versions_url)
    FileVersion.exists?(file_version.id).should be_false
  end
end
