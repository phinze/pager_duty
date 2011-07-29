require 'spec_helper'

describe PagerDuty::API::Schedules do
  describe "list" do
    it "returns a hash of schedules ids by title" do
      ids = pagerduty.schedules.list
      ids.should have_at_least(1).item
    end
  end

  describe "entries" do
    it "returns schedule entries with start, end, and user" do
      result = pagerduty.schedules.entries(
        example_schedule_id,
        :since => "2011-07-01",
        :until => "2011-07-31"
      )
      result.success?.should be_true
      result.should have_at_least(1).entry
      result.each do |schedule_entry|
        puts "start: #{schedule_entry.start} end: #{schedule_entry.end}; user: #{schedule_entry.user.email}"
        schedule_entry.start.should_not be_nil
        schedule_entry.end.should_not be_nil
        schedule_entry.user.should_not be_nil
      end
    end
  end
end
