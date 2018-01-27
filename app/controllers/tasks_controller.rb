class TasksController < ApplicationController

  include Banken

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to action: :new
    else
      render "new"
    end
  end

  def show
    task = Task.find(params[:id])
    @task = task.decorate
    authorize! @task
  end

  def monthly
    @date = params[:date].try(:to_date) || Date.today
    @prev_month = @date.advance(months: -1)
    @next_month = @date.advance(months: 1)
    daily_tasks = Task.fetch_tasks_for_the_month(@date, current_user, :daily)
    @days = MonthlyCalendarService.new(@date, daily_tasks).to_a.flatten
    @monthly_tasks = Task.fetch_tasks_for_the_month(@date, current_user, :monthly)
  end

  def weekly
    @date = params[:date].try(:to_date) || Date.today
    @prev_week = @date.advance(weeks: -1)
    @next_week = @date.advance(weeks: 1)
    daily_tasks = Task.fetch_tasks_for_the_week(@date, current_user, :daily)
    @days = WeeklyCalendarService.new(@date, daily_tasks).to_a.flatten
    @weekly_tasks = Task.fetch_tasks_for_the_week(@date, current_user, :weekly)
  end

  def daily
  end

  private
    def task_params
      params.require(:task).permit(:title, :kind, :start_time, :finish_time, :date, :week, :month).merge(user_id: current_user.id)
    end
end
