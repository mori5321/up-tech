class WeeklyCalendarService
  attr_reader :date, :tasks

  def initialize(date, tasks)
    @date = date
    @tasks = tasks
  end

  def to_a
    (first_date..last_date)
      .map { |date|
        {
          date: date || '' ,
          tasks: tasks_on_the_day(date)
        }
      }
      .each_slice(7)
      .to_a
  end

  private
    def tasks_on_the_day(day)
      return false if day.nil?
      datetime = day.to_datetime
      tasks_on_the_day = tasks.where("start_datetime BETWEEN ? AND ?", datetime, datetime.end_of_day)
      return tasks_on_the_day
    end

    def first_date
      date.beginning_of_week
    end

    def last_date
      date.end_of_week
    end
end