require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "FleetMED |"
  end

  test "should get welcome" do
    get '/'
    assert_response :success
    assert_select "title", "#{@base_title} Welcome"
  end

  test "should get signup" do
    get '/signup'
    assert_response :success
    assert_select "title", "#{@base_title} Sign Up"
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
