require 'rails_helper'

describe ReportsController do
	
	context 'GET #index' do
		it "assigns reports" do
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
		it "blocks unauthenticated access" do
			post :create
			expect(response).to redirect_to(new_user_session_path)
		end

		it "allows logged in users to have access" do
			login_user
			post :create, report: FactoryGirl.attributes_for(:report)
			expect(response).to_not redirect_to(new_user_session_path)
		end

		context "with valid attributes" do
			it "saves the new report in the database" do
				expect{FactoryGirl.create :report}.to change(Report, :count).by(1)
			end

			it "redirects to the state report page" do
				login_user
				post :create, report: FactoryGirl.attributes_for(:report)
				expect(response).to redirect_to california_path
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

	context 'GET #show' do
		it "assigns @report to the correct report" do
			report = FactoryGirl.create :report
			get :show, id: report
			expect(assigns(:report)).to eq report
		end

		it "renders the show page" do
			report = FactoryGirl.create :report
			get :show, id: report
			expect(response).to render_template :show
		end
	end

	context 'GET #edit' do
		it "assigns @report to the correct report" do
			report = FactoryGirl.create :report
			get :edit, id: report
			expect(assigns(:report)).to eq report
		end

		it "blocks unauthenticated access" do
			report = FactoryGirl.create :report
			get :edit, id: report
			expect(response).to redirect_to(new_user_session_path)
		end

		it "allows logged in users to edit their reports" do
			login_user
			report = FactoryGirl.create :report
			get :edit, id: report
			expect(response).to render_template :edit
		end
	end

	context 'PATCH #update' do

		it "blocks unauthenticated access" do
			report = FactoryGirl.create :report
			patch :update, id: report
			expect(response).to redirect_to(new_user_session_path)
		end

		context "with valid attributes" do
			before :each do
				login_user
				@report = FactoryGirl.create :report
			end
			
			it "finds the requested report" do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report)
				expect(assigns(:report)).to eq(@report)
			end
			
			it "changes the report's attributes" do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report, hospital: "Mercy Hospital")
				@report.reload
				expect(@report.hospital).to eq("Mercy Hospital")
			end

			it "redirects to the updated report" do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report)
				expect(response).to redirect_to @report
			end
		end

		context "with invalid attributes" do
			before :each do
				login_user
				@report = FactoryGirl.create :report
			end

			it "does not change the report's attributes" do
				patch :update, id: @report, report: FactoryGirl.attributes_for(:report, generation: nil)
				@report.reload
				expect(@report.generation).to eq("child")
			end

			it "re-renders the edit template" do 
				patch :update, id: @report, report: FactoryGirl.attributes_for(:invalid_report)
				expect(response).to render_template :edit
			end
		end
	end

	context 'DELETE #destroy' do
		before :each do 
			login_user
			@report = FactoryGirl.create :report
		end

		it "deletes the requested report" do 
			expect { delete :destroy, id: @report}.to change(Report, :count).by(-1)
		end

		it "redirects the user to the state report page" do
			delete :destroy, id: @report
			expect(response).to redirect_to "/#{@report.state.downcase}"
		end
	end

	us_states.each do |array|
		state = array.first
		context "GET #{state.downcase}" do
			before :each do 
	 			login_user
	 			@report = FactoryGirl.create :report, state: state
		 	end

		 	it "assigns reports to the correct state collection" do
		 		get :"#{state.downcase}"
				expect(assigns(:reports)).to match_array([@report])
			end

			it "renders the #{state.downcase} template" do
				get :"#{state.downcase}"
				expect(response).to render_template :"#{state.downcase}"
			end
		end
	end
end