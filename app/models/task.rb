class Task < ApplicationRecord
  belongs_to :user

  attr_accessor :month, :week, :date, :start_time, :finish_time

  enum kind: {
    daily: 0,
    weekly: 1,
    monthly: 2
  }

  validates :title, presence: true
  validates :kind, presence: true
  validates :start_datetime, presence: true
  validates :finish_datetime, presence: true
  validates :user_id, presence: true
  validate  :start_datetime_should_be_less_than_finish_datetime

  before_validation :set_datetime

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

  def set_datetime_for_weekly_task
    datetime = week.to_datetime
    self.start_datetime = datetime
    self.finish_datetime = datetime.end_of_week
  end

  def set_datetime_for_monthly_task
    year_int = month.split("-")[0].to_i
    month_int = month.split("-")[1].to_i
    self.start_datetime = DateTime.new(year_int, month_int)
    self.finish_datetime = start_datetime.end_of_month
  end

  def start_datetime_should_be_less_than_finish_datetime
    errors.add(:start_date, "をfinish_dateより前に入力してください") unless start_datetime <= finish_datetime
  end

  # 日付処理: 参考文献
  # https://qiita.com/prgseek/items/c0fc2ffc8e1736348486
end
