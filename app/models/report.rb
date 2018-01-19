class Report < ApplicationRecord
  belongs_to :task

  attr_accessor :month, :week, :date, :start_time, :finish_time

  validates :start_datetime, presence: true
  validates :finish_datetime, presence: true
  validate  :start_datetime_should_be_less_than_finish_datetime

  include DateTimeConvertable

  def kind
    task.kind
  end

  private
    #HACK: need to refactor (to make this DRY).
    def start_datetime_should_be_less_than_finish_datetime
      errors.add(:start_date, "をfinish_dateより前に入力してください") unless start_datetime <= finish_datetime
    end
end
