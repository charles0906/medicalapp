require 'spec_helper'

describe "people/new.html.erb" do
  before(:each) do
    assign(:person, stub_model(Person,
      :user_id => 1,
      :name => "MyString",
      :lastname => "MyString",
      :sex => "MyString",
      :birthday => "MyString",
      :cellnumber => "MyString",
      :city => "MyString",
      :address => "MyString",
      :typeper => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_user_id", :name => "person[user_id]"
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_lastname", :name => "person[lastname]"
      assert_select "input#person_sex", :name => "person[sex]"
      assert_select "input#person_birthday", :name => "person[birthday]"
      assert_select "input#person_cellnumber", :name => "person[cellnumber]"
      assert_select "input#person_city", :name => "person[city]"
      assert_select "input#person_address", :name => "person[address]"
      assert_select "input#person_typeper", :name => "person[typeper]"
      assert_select "input#person_status", :name => "person[status]"
    end
  end
end
