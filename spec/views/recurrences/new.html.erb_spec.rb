require 'spec_helper'

describe "recurrences/new.html.erb" do
  before(:each) do
    assign(:recurrence, stub_model(Recurrence,
      :doctor_id => 1,
      :day => "MyString"
    ).as_new_record)
  end

  it "renders new recurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recurrences_path, :method => "post" do
      assert_select "input#recurrence_doctor_id", :name => "recurrence[doctor_id]"
      assert_select "input#recurrence_day", :name => "recurrence[day]"
    end
  end
end
