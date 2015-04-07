require 'rails_helper'

describe Report do
	report = FactoryGirl.build :report

	it "is valid with all required information" do
		expect(report).to be_valid
	end

	it "is invalid without a generation" do
		report.generation = nil
		expect(report).not_to be_valid
	end

	it "is invalid without a content" do
		report.content = nil
		expect(report).not_to be_valid
	end
end