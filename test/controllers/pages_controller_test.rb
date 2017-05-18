require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get '/'
    assert_response :success
  end

  test "should get register" do
    get '/register'
    assert_response :success
  end

  test "should get search" do
    get '/search'
    assert_response :success
  end

end
