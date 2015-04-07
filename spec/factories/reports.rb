FactoryGirl.define do
	factory :report do
		user
		hospital "Sibley Hospital"
		generation "child"
		content "This is a really long content post."
	end
end