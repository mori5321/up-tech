class Task < ApplicationRecord
  belongs_to :user
  has_one :report

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

  include DateTimeConvertable

  scope :dones, -> { select{ |t| t.report.present? } }

  private

  def start_datetime_should_be_less_than_finish_datetime
    errors.add(:start_date, "をfinish_dateより前に入力してください") unless start_datetime <= finish_datetime
  end

  # 日付処理: 参考文献
  # https://qiita.com/prgseek/items/c0fc2ffc8e1736348486
end
