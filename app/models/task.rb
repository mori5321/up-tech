class Task < ApplicationRecord
  belongs_to :user

  attr_accessor :month, :week, :date, :start_time, :finish_time

  enum kind: {
    daily: 0,
    weekly: 1,
    monthly: 2
  }

  before_save :set_datetime

  def set_datetime
    case kind
    when 'daily'
      set_datetime_for_daily_task
    when 'weekly'
      set_datetime_for_weekly_task
    when 'monthly'
      set_datetime_for_monthly_task
    else
      # 例外処理
    end
  end

  private
  # HACK: need to refactor this method
  def set_datetime_for_daily_task
    datetime = date.to_datetime
    start_hour = start_time.split(":")[0].to_i
    start_minute = start_time.split(":")[1].to_i
    finish_hour = finish_time.split(":")[0].to_i
    finish_minute = finish_time.split(":")[1].to_i
    self.start_datetime = datetime.advance(hours: start_hour, minutes: start_minute)
    self.finish_datetime = datetime.advance(hours: finish_hour, minutes: finish_minute)
  end
end
