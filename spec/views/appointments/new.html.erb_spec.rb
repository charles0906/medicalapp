require 'spec_helper'

describe "appointments/new.html.erb" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :doctor_id => 1,
      :patient_id => 1,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => appointments_path, :method => "post" do
      assert_select "input#appointment_doctor_id", :name => "appointment[doctor_id]"
      assert_select "input#appointment_patient_id", :name => "appointment[patient_id]"
      assert_select "input#appointment_status", :name => "appointment[status]"
    end
  end
end
