require 'rails_helper'

describe ReportsController do
	
	context 'GET #index' do
		it "assigns @reports" do
			report = FactoryGirl.create :report
			get :index
			expect(assigns(:reports)).to match_array([report])
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template :index
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

	context 'POST #create' do
		context "with valid attributes" do
			it "saves the new report in the database" do
				expect{FactoryGirl.create :report}.to change(Report, :count).by(1)
			end

			it "redirects to reports#index" do
				login_user
				post :create, report: FactoryGirl.attributes_for(:report)
				expect(response).to redirect_to reports_path
			end
		end

		context "with invalid attributes"do
			it "does not save the new report in the database" do
				expect{FactoryGirl.build :invalid_report}.to_not change(Report, :count)
			end

			it "re-renders the new report template" do
				login_user
				post :create, report: FactoryGirl.attributes_for(:invalid_report)
				expect(response).to render_template :new
			end
		end
	end
end