require 'rails_helper'

describe User do
	user = FactoryGirl.build :user

	xit "is invalid without a display name" do
		user.displayname = nil
		expect(user).not_to be_valid
	end
end