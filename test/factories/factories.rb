FactoryGirl.define do 
	factory :user do
		sequence(:email) { |n| "person#{n}@example.com" }
		password "12fdsa12"
	end

	factory :course do
		title 'Ruby'
		description 'A course on Ruby'
		cost 20
		association :user
	end	

	factory :section do
		title 'Introduction to Ruby'
		row_order '0'
		association :course
	end

	factory :lesson do
		title 'For Beginners'
		subtitle 'Part one Strings'
		video 'ruby.mp4'
		row_order '0'
		association :section
	end
	
end