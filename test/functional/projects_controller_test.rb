require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Projects.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Projects.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Projects.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to projects_url(assigns(:projects))
  end
  
  def test_edit
    get :edit, :id => Projects.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Projects.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Projects.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Projects.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Projects.first
    assert_redirected_to projects_url(assigns(:projects))
  end
  
  def test_destroy
    projects = Projects.first
    delete :destroy, :id => projects
    assert_redirected_to projects_url
    assert !Projects.exists?(projects.id)
  end
end
