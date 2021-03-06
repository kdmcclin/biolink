class ReportsController < ApplicationController
	
	before_action :get_report, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@reports = Report.all
	end

	def new
		@report = Report.new 
	end

	def create
		@report = current_user.reports.new(report_params)

		if @report.save
			redirect_to "/#{@report.state.downcase}"
		else
			render :action => "new"
		end
	end

	def show
		@comment = Comment.new
	end

	def edit
	end

	def update
		if @report.update(report_params)
			redirect_to report_path(@report)
		else
			render :action => "edit"
		end
	end

	def destroy
		@report.destroy
		redirect_to "/#{@report.state.downcase}"
	end

	us_states.each do |array|
		state = array.first
		define_method(state.downcase) do
			if params[:search]
				@reports = Report.search_text(params[:search]).page params[:page]
				@search_term = params[:search]
			else
				@reports = Report.where(:state => "#{state}").order(updated_at: :desc).page params[:page]
			end
		end
	end

	private
	def get_report
		@report = Report.find(params[:id])
	end

	def report_params
		params.require(:report).permit([:country, :state, :hospital, :birthday, :generation, :content])
	end
end