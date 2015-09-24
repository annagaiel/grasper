require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  test "Instructor creates lesson" do
  	section = FactoryGirl.create(:section)
  	sign_in section.course.user
  	post :create, :section_id => section.id, :lesson => {:title => 'Ruby', :subtitle => 'Basic Strings', :video => 'ruby.mp4'}
    
    assert_redirected_to instructor_course_path(section.course)
  end

  test "Non-instructor creates lesson" do
  	section = FactoryGirl.create(:section)
  	user = FactoryGirl.create(:user)
  	sign_in user
  	post :create, :section_id => section.id, :lesson => {:title => 'Ruby', :subtitle => 'Basic Strings', :video => 'ruby.mp4'}
    
    assert_response :unauthorized
  end
end
