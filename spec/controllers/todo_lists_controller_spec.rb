require File.dirname(__FILE__) + '/../spec_helper'
 
describe TodoListsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => TodoList.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    TodoList.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    TodoList.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(todo_list_url(assigns[:todo_list]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => TodoList.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    TodoList.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TodoList.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    TodoList.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TodoList.first
    response.should redirect_to(todo_list_url(assigns[:todo_list]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    todo_list = TodoList.first
    delete :destroy, :id => todo_list
    response.should redirect_to(todo_lists_url)
    TodoList.exists?(todo_list.id).should be_false
  end
end
