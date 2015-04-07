class ReportController < ApplicationController
	
	before_action :get_report, only [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except [:index, :show]

	def index
		@reports = Report.all
	end

	def new
		@report = Report.new 
	end

	def create
		@report = current_user.reports.new(report_params)

		if report.save
			redirect_to reports_path
		else
			flash[:error] = "Report could not be saved"
			render :action => "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		@report.update(report_params)
		redirect_to report_path(@report)
	end

	def destroy
		@report.destroy
		redirect_to "/#{@report.state.downcase}"
	end

	private
	def get_report
		@report = Report.find(params[:id])
	end

	def report_params
		params.require(:report).permit([:country, :state, :hospital, :birthday, :generation, :content])
	end
end