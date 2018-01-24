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

  def self.fetch_tasks_for_the_month(date, user, kind)
    first_date = DateTime.new(date.year, date.month, 1)
    last_date = DateTime.new(date.year, date.month, -1, -1, -1, -1, -1)
    self.where(kind: kind).where("start_datetime between ? and ?", first_date, last_date).where(user_id: user.id).order("start_datetime ASC")
  end

  private

  def start_datetime_should_be_less_than_finish_datetime
    errors.add(:start_date, "をfinish_dateより前に入力してください") unless start_datetime <= finish_datetime
  end

  # 日付処理: 参考文献
  # https://qiita.com/prgseek/items/c0fc2ffc8e1736348486
end
