require 'rails_helper'

describe CommentsController do
	
	context 'POST #create' do
		it "blocks unauthenticated access" do
			report = FactoryGirl.create :report
			post :create, report_id: report.id
			expect(response).to redirect_to(new_user_session_path)
		end

		it "allows logged in users to have access" do
			login_user
			report = FactoryGirl.create :report
			post :create, report_id: report.id, comment: FactoryGirl.attributes_for(:comment)
			expect(response).to_not redirect_to(new_user_session_path)
		end

		context "with valid attributes" do
			it "saves the new comment in the database" do
				report = FactoryGirl.create :report
				expect{FactoryGirl.create :comment, report_id: report.id}.to change(Comment, :count).by(1)
			end

			it "redirects to the comment's report page" do
				login_user
				report = FactoryGirl.create :report
				post :create, report_id: report.id, comment: FactoryGirl.attributes_for(:comment)
				expect(response).to redirect_to report_path(report)
			end
		end

		context "with invalid attributes"do
			it "does not save the new comment in the database" do
				report = FactoryGirl.create :report
				expect{FactoryGirl.build :invalid_comment, report_id: report.id}.to_not change(Comment, :count)
			end

			it "re-renders the new comment template" do
				login_user
				report = FactoryGirl.create :report
				post :create, report_id: report.id, comment: FactoryGirl.attributes_for(:invalid_comment)
				expect(response).to redirect_to report_path(report)
			end
		end
	end

	context 'GET #edit' do
		it "assigns @comment to the correct comment" do
			login_user
			report = FactoryGirl.create :report
			comment = FactoryGirl.create :comment, report: report
			get :edit, id: comment, report_id: report.id
			expect(assigns(:comment)).to eq comment
		end

		it "blocks unauthenticated access" do
			report = FactoryGirl.create :report
			comment = FactoryGirl.create :comment, report: report
			get :edit, id: report, report_id: report.id
			expect(response).to redirect_to(new_user_session_path)
		end

		it "allows logged in users to edit their comments" do
			login_user
			report = FactoryGirl.create :report
			comment = FactoryGirl.create :comment, report: report
			get :edit, id: comment, report_id: report.id
			expect(response).to render_template :edit
		end
	end
end