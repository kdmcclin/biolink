require 'rails_helper'

describe Comment do
	comment = FactoryGirl.build :comment

	it "is valid with all required information" do
		expect(comment).to be_valid
	end

	it "is invalid without content" do
		comment.content = nil
		expect(comment).not_to be_valid
	end
end