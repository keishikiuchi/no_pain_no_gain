require 'test_helper'

class Users::BodiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_bodies_new_url
    assert_response :success
  end

end
