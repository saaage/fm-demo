require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    get '/providers'
    assert_response :success
  end
  
end
