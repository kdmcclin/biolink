FactoryGirl.define do
	factory :report do
		hospital "Sibley Hospital"
		generation "child"
		content "This is a really long content post."
		user
	end
end

FactoryGirl.define do
	factory :invalid_report do
		hospital "Sibley Hospital"
		content "This is a really long content post."
		user
	end
end