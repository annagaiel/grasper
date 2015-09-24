require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
	test "should get dashboard show" do
		user = FactoryGirl.create(:user)
    sign_in user
    get :show
    assert_response :success
  end

  test "user not signed in on dashboard show" do
    get :show
    assert_redirected_to new_user_session_path
  end
end
