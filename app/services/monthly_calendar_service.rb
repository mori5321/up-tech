class MonthlyCalendarService
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def to_a
    [
      *Array.new(first_date.wday),
      *1..last_date.day,
      *Array.new(6 - last_date.wday)
    ]
      .map { |date| { date: date || '' } }
      .each_slice(7)
      .to_a
  end

  private

  def first_date
    Date.new(date.year, date.month, 1)
  end

  def last_date
    Date.new(date.year, date.month, -1)
  end
end