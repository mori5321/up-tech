class ReportsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @report = @task.reports.build
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to action: :new
    else
      render "new"
    end
  end

  private
    def report_params
      params.require(:report).permit(:start_time, :finish_time, :date, :week, :month).merge(task_id: params[:task_id])
    end
end
