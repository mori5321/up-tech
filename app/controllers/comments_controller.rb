class CommentsController < ApplicationController
  include Banken

  def new
    report = current_user.subordinate_users_reports.first
    @report = report.decorate
    task = @report.task
    @task = task.decorate
    @comment = @report.comments.build
  end

  def create
  end
end
