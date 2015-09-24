require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Course is free" do
  	course = FactoryGirl.create(:course, :cost =>0)
    assert_equal true, course.free?

    course = FactoryGirl.create(:course, :cost =>1)

    assert_equal false, course.free?
  end

  test "Validation for title" do
   course = FactoryGirl.build(:course, :title => "")
   is_valid = course.valid?
   assert_equal false, is_valid
  end

  test "Validation for cost" do
  	course = FactoryGirl.build(:course, :cost => -1)
  	is_valid = course.valid?
  	assert_equal false, is_valid
  end



end
