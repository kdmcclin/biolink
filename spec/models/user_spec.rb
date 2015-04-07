require 'rails_helper'

describe User do
	user = FactoryGirl.build :user
	user2 = FactoryGirl.build :user

	it "is valid with all required information" do
		expect(user).to be_valid
	end

	it "is invalid without a display name" do
		user.displayname = nil
		expect(user).not_to be_valid
	end

	it "must have a unique display name" do
		user2.displayname = "user1"
		expect(user2).not_to be_valid
	end
end