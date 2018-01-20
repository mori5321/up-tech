module DateTimeConvertable
  extend ActiveSupport::Concern

  included do
    before_validation :set_datetime
  end

  def set_datetime
    datetime_hash = case kind
                    when 'daily'
                      datetime_hash_for_daily_task
                    when 'weekly'
                      datetime_hash_for_weekly_task
                    when 'monthly'
                      datetime_hash_for_monthly_task
                    else
                      # 例外処理
                    end
    assign_datetime_to_attributes(datetime_hash[:start_datetime], datetime_hash[:finish_datetime])
  end

  private
  def assign_datetime_to_attributes(start_datetime, finish_datetime)
    binding.pry
    self.start_datetime = jst_to_utc(start_datetime)
    self.finish_datetime = jst_to_utc(finish_datetime)
  end
  # HACK: need to refactor this method
  def datetime_hash_for_daily_task
    datetime = date.to_datetime

    start_hour = extract_from_time_str(start_time, :hour)
    start_minute = extract_from_time_str(start_time, :minute)
    finish_hour = extract_from_time_str(finish_time, :hour)
    finish_minute = extract_from_time_str(finish_time, :minute)

    start_datetime = datetime.advance(hours: start_hour, minutes: start_minute)
    finish_datetime = datetime.advance(hours: finish_hour, minutes: finish_minute)
    return { start_datetime: start_datetime, finish_datetime: finish_datetime }
  end

  def datetime_hash_for_weekly_task
    start_datetime = week.to_datetime
    return { start_datetime: start_datetime, finish_datetime: start_datetime.end_of_week }
  end

  def datetime_hash_for_monthly_task
    year_int = month.split("-")[0].to_i
    month_int = month.split("-")[1].to_i
    start_datetime = DateTime.new(year_int, month_int)
    return { start_datetime: start_datetime, finish_datetime: start_datetime.end_of_month }
  end

  def jst_to_utc(datetime)
    datetime.advance(hours: -9).in_time_zone("UTC")
  end

  def extract_from_time_str(time_str, type)
    case type
    when :hour
      time_str.split(":")[0].to_i
    when :minute
      time_str.split(":")[1].to_i
    else
      raise "Invalid Argument for type. Please Set :hour or :minute"
    end
  end

  # 日付処理: 参考文献
  # https://qiita.com/prgseek/items/c0fc2ffc8e1736348486
end