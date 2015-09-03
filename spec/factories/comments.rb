FactoryGirl.define do
	factory :comment do 
		content "This is a really long and insightful comment"
		user
		report

		factory :invalid_comment do
			content nil
			user
			report
		end
	end
end