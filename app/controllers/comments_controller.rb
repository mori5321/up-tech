class CommentsController < ApplicationController
  include Banken

  def new
    report = current_user.subordinate_users_reports_to_be_checked.first
    @report = report.decorate
    task = @report.task
    @task = task.decorate
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to action: :new
    else
      report = current_user.subordinate_users_reports_to_be_checked.first
      @report = report.decorate
      task = @report.task
      @task = task.decorate
      render "new"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(report_id: params[:report_id], user_id: current_user.id)
    end
end
