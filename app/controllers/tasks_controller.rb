class TasksController < ApplicationController
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
  end

  def monthly
  end

  def weekly
  end

  def daily
  end

  private
    def task_params
      params.require(:task).permit(:title, :kind, :start_time, :finish_time, :date, :week, :month).merge(user_id: current_user.id)
    end
end
