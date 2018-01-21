class ReportsController < ApplicationController

  include Banken

  def new
    @task = Task.find(params[:task_id])
    if @task.report.present? #仮実装
      redirect_to root_path
    else
      @report = @task.report.build
    end
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
