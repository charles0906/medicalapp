require 'spec_helper'

describe "appointments/index.html.erb" do
  before(:each) do
    assign(:appointments, [
      stub_model(Appointment,
        :doctor_id => 1,
        :patient_id => 1,
        :status => "Status"
      ),
      stub_model(Appointment,
        :doctor_id => 1,
        :patient_id => 1,
        :status => "Status"
      )
    ])
  end

  it "renders a list of appointments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
