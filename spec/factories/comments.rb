FactoryGirl.define do
	factory :comment do 
		content "This is a really long and insightful comment"
		user
		report
	end
end