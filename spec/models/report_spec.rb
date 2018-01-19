require 'rails_helper'

RSpec.describe Report, type: :model do
  context "for daily_task" do
    let(:task) { create(:task) }
    let(:report) { build(:report, task: task)}
    it "has a valid factory of report for daily_task" do
      expect(report).to be_valid
    end

    it "raises NoMethod error without start_time" do
      report.start_time = nil
      expect{ report.valid? }.to raise_error(NoMethodError)
    end

    it "raises NoMethod error without finish_time" do
      report.finish_time = nil
      expect{ report.valid? }.to raise_error(NoMethodError)
    end
  end

  context "for weekly_task " do
    let(:task) { create(:weekly_task) }
    let(:report) { build(:weekly_report, task: task)}
    it "has a valid factory of report for weekly_task" do
      expect(report).to be_valid
    end
  end

  context "for monthly_task" do
    let(:task) { create(:monthly_task) }
    let(:report) { build(:monthly_report, task: task)}
    it "has a valid factory of report for monthly_task" do
      expect(report).to be_valid
    end
  end
end
