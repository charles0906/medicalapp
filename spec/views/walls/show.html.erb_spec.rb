require 'spec_helper'

describe "walls/show.html.erb" do
  before(:each) do
    @wall = assign(:wall, stub_model(Wall,
      :doctor_id => 1,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
