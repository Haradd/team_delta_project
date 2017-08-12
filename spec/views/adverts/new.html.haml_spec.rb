require "rails_helper"

RSpec.describe "adverts/new", type: :view do
  before(:each) do
    assign(:advert, Advert.new(
                      title: "",
                      city: "MyString",
                      street: "MyString",
                      phone: "MyString"
    ))
  end

  it "renders new advert form" do
    render

    assert_select "form[action=?][method=?]", adverts_path, "post" do
      assert_select "input[name=?]", "advert[title]"

      assert_select "input[name=?]", "advert[city]"

      assert_select "input[name=?]", "advert[street]"

      assert_select "input[name=?]", "advert[phone]"
    end
  end
end
