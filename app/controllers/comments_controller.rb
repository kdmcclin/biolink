class CommentsController < ApplicationController
	before_action :get_report
	before_action :authenticate_user!

	def create
		@comment = @report.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to report_path(@report)
		else
			flash[:error] = "Comment could not be saved."
			render :action => "new"
		end

		#TODO - AJAX this later
	end

	def destroy
		@comment = @report.comments.find(params[:id])
		@comment.destroy
		redirect_to report_path(@report)

		#TODO - AJAX this later
	end

	private

	def get_report
		@report = Report.find(params[:report_id])
	end

	def comment_params
		params.require(:comment).permit([:content, :user_id])
	end
end