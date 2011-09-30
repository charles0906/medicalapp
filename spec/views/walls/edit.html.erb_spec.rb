require 'spec_helper'

describe "walls/edit.html.erb" do
  before(:each) do
    @wall = assign(:wall, stub_model(Wall,
      :doctor_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit wall form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => walls_path(@wall), :method => "post" do
      assert_select "input#wall_doctor_id", :name => "wall[doctor_id]"
      assert_select "input#wall_status", :name => "wall[status]"
    end
  end
end
