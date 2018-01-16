require 'rails_helper'

describe Task do
  context "as daily_task" do
    let(:task) { build(:task) }

    # 正常系
    it 'has a valid factory of daily_task' do
      expect(task).to be_valid
    end

    it "has an attribute monthly_task" do
      expect(task.kind).to eq "daily"
    end


    # 以上系
    it 'is invalid without name' do
      task.title = nil
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it 'raises NoMethodError without kind' do
      task.kind = nil
      expect{ task.valid? }.to raise_error(NoMethodError)
    end

    describe "datetime" do
      # 正常系
      it "is valid when start_datetime is less than or equal to finish_datetime" do
        task = build(:task, start_time: "10:00", finish_time: "10:01")
        task.valid?
        expect(task).to be_valid
      end

      # 異常系
      it "is invalid when start_datetime is greater than finish datetime" do
        task = build(:task, start_time: "10:00", finish_time: "09:59")
        task.valid?
        expect(task.errors[:start_date]).to include("をfinish_dateより前に入力してください")
      end

      it "is invalid with invalid input on start_time" do
        task = build(:task, start_time: "10時", finish_time: "11時")
        task.valid?
        expect(task).to be_valid
      end
    end
  end

  context "as weekly_task" do
    let(:task) { build(:weekly_task)}

    describe "datetime" do
      # 正常系
      it "has a valid facory of weekly_task" do
        expect(task).to be_valid
      end

      it "has an attribute weekly_task" do
        expect(task.kind).to eq "weekly"
      end

      # 異常系
      it "raises NoMethodError without week" do
        task.week = nil
        expect{ task.valid? }.to raise_error(NoMethodError)
      end
    end
  end

  context "as monthly_task" do
    let(:task) { build(:monthly_task)}

    describe "datetime" do
      it "has a valid facory of monthly_task" do
        expect(task).to be_valid
      end

      it "has an attribute monthly_task" do
        expect(task.kind).to eq "monthly"
      end

      it "raises NoMethodError without month" do
        task.month = nil
        expect{ task.valid? }.to raise_error(NoMethodError)
      end
    end
  end
end