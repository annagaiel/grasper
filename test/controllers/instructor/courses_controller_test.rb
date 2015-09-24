require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  test "instructor new course" do
  	user = FactoryGirl.create(:user)
  	sign_in user
  	get :new
  	assert_response :success
  end

  test "instructor create course" do
  	user = FactoryGirl.create(:user)
  	sign_in user

  	assert_difference 'Course.count' do
  	# number_of_courses = Course.count
      post :create, {:course => {
      	:title => 'Ruby',
      	:description => 'Course on Ruby',
      	:cost => 20
      }
     }
    end
    # number_of_courses_after = Course.count
    # diff = number_of_courses_after - number_of_courses
    # assert_equal 1, diff
    
    assert_redirected_to instructor_course_path(Course.last)
    assert_equal 1, user.courses.count
  end

	test "instructor create invalid course" do
  	user = FactoryGirl.create(:user)
  	sign_in user

    post :create, {:course => {
      :title => '',
      :description => '',
      :cost => 'abc'
      }
    }
    assert_response :unprocessable_entity
  end

end
