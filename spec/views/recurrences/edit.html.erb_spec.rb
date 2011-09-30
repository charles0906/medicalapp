require 'spec_helper'

describe "recurrences/edit.html.erb" do
  before(:each) do
    @recurrence = assign(:recurrence, stub_model(Recurrence,
      :doctor_id => 1,
      :day => "MyString"
    ))
  end

  it "renders the edit recurrence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recurrences_path(@recurrence), :method => "post" do
      assert_select "input#recurrence_doctor_id", :name => "recurrence[doctor_id]"
      assert_select "input#recurrence_day", :name => "recurrence[day]"
    end
  end
end
