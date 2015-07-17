FactoryGirl.define do
	factory :report do
		hospital "Sibley Hospital"
		generation "child"
		content "This is a really long content post."
		user

		factory :invalid_report do
		hospital "Sibley Hospital"
		generation nil
		content "This is a really long content post."
		user
		end
	end
end