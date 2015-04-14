require 'rails_helper'

describe ReportsController do
	
	context 'GET #new' do
		it "blocks unauthenticated access" do
			user = FactoryGirl.build :user
			sign_out(user)
			#sign_in nil
			get :new
			expect(response).to redirect_to(new_user_session_path)
		end
	end
end