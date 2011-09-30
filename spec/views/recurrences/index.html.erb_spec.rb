require 'spec_helper'

describe "recurrences/index.html.erb" do
  before(:each) do
    assign(:recurrences, [
      stub_model(Recurrence,
        :doctor_id => 1,
        :day => "Day"
      ),
      stub_model(Recurrence,
        :doctor_id => 1,
        :day => "Day"
      )
    ])
  end

  it "renders a list of recurrences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Day".to_s, :count => 2
  end
end
