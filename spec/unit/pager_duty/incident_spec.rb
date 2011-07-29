require 'spec_helper'

describe PagerDuty::Incident do
  describe "top level attributes" do
    [:incident_number,
     :status,
     :created_on,
     :html_url,
     :incident_key,
     :last_status_change_on,
     :trigger_details_html_url,
     :trigger_summary_data
     ].each do |attribute|
      it "gets #{attribute} from the top-level of the init hash" do
        value = rand(10000).to_s
        incident = described_class.new({"#{attribute}" => value})
        incident.send(attribute).should == value
      end
    end
  end

  describe "delegated attributes" do
    it "delegates service sub-hash to PagerDuty::Service" do
      described_class.new({"service" => {}}).service.should be_a PagerDuty::Service
    end

    it "delegates assigned_to_user sub-hash to PagerDuty::User" do
      described_class.new({"assigned_to_user" => {}}).assigned_to_user.should be_a PagerDuty::User
    end

    it "delegates last_status_change_by sub-hash to PagerDuty::User" do
      described_class.new({"last_status_change_by" => {}}).last_status_change_by.should be_a PagerDuty::User
    end
  end

end
