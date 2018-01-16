require 'rails_helper'

describe Task do
  it 'has a valid factory' do
    expect(build(:task)).to be_valid
  end

  describe "datetime" do
    it "is valid when start_datetime is less than finish_datetime" do
      task = build(:task, start_time: "10:00", finish_time: "10:01")
      task.valid?
      expect(task).to be_valid
    end

    it "is invalid when start_datetime is greater than finish datetime" do
      task = build(:task, start_time: "10:00", finish_time: "09:59")
      task.valid?
      expect(task.errors[:start_date]).to include("をfinish_dateより前に入力してください")
    end
  end
end