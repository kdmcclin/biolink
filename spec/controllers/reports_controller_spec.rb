require 'rails_helper'

describe ReportsController do
	
	context 'GET #index' do
		it "assigns @reports" do
			report = FactoryGirl.create :report
			get :index
			expect(assigns(:reports)).to match_array([report])
		end
	end

	context 'GET #new' do
		it "blocks unauthenticated access" do
			get :new
			expect(response).to redirect_to(new_user_session_path)
		end

		it "allows logged in users to have access" do
			login_user
			get :new
			expect(response.status).to eq(200)
		end
	end
end