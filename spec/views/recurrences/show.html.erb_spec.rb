require 'spec_helper'

describe "recurrences/show.html.erb" do
  before(:each) do
    @recurrence = assign(:recurrence, stub_model(Recurrence,
      :doctor_id => 1,
      :day => "Day"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Day/)
  end
end
