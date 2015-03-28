FactoryGirl.define do 
	factory :user do 
		sequence(:displayname) {|n| "user#{n}"}
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
	end
end