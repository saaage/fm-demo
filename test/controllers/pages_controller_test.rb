require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get '/'
    assert_response :success
    assert_select "title", "FleetMED | Login"
  end

  test "should get register" do
    get '/register'
    assert_response :success
    assert_select "title", "FleetMED | Register"
  end

  test "should get search" do
    get '/search'
    assert_response :success
    assert_select "title", "FleetMED | Search"
  end

  test "should get dashboard" do
    get '/dashboard'
    assert_response :success
    assert_select "title", "FleetMED | Home"
  end

end
