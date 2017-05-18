require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "FleetMED |"
  end

  test "should get login" do
    get '/'
    assert_response :success
    assert_select "title", "#{@base_title} Login"
  end

  test "should get register" do
    get '/register'
    assert_response :success
    assert_select "title", "#{@base_title} Register"
  end

  test "should get search" do
    get '/search'
    assert_response :success
    assert_select "title", "#{@base_title} Search"
  end

  test "should get dashboard" do
    get '/dashboard'
    assert_response :success
    assert_select "title", "#{@base_title} Home"
  end

end
