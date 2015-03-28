FactoryGirl.define do 
	factory :user do 
		displayname nil
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
	end
end