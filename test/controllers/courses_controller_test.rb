require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "course show page" do
    course = FactoryGirl.create(:course)
    get :show, :id => course.id
    assert_response :success
  end
end
