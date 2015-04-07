FactoryGirl.define do
	factory :comment do 
		user
		report
		content "This is a really long and insightful comment"
	end
end