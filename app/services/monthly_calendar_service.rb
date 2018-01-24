class MonthlyCalendarService
  attr_reader :date, :tasks

  def initialize(date, tasks)
    @date = date
    @tasks = tasks
  end

  def to_a
    [
      *Array.new(first_date.wday),
      *1..last_date.day,
      *Array.new(6 - last_date.wday)
    ]
      .map { |date|
        {
          date: date || '' ,
          has_task: has_task?(date)
        }
      }
      .each_slice(7)
      .to_a
  end

  private
    def has_task?(day)
      return false if day.nil?
      datetime = DateTime.new(date.year, date.month, day).in_time_zone
      datetime_end = DateTime.new(date.year, date.month, day, -1, -1, -1, -1).in_time_zone
      tasks_on_the_day = tasks.where("start_datetime BETWEEN ? AND ?", datetime, datetime_end)
      tasks_on_the_day.exists?
    end

    def to_jst(datetime)
      datetime.advance(hours: 9)
    end

    def first_date
      Date.new(date.year, date.month, 1)
    end

    def last_date
      Date.new(date.year, date.month, -1)
    end
end