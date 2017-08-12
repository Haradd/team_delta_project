require "rails_helper"

RSpec.describe "adverts/edit", type: :view do
  before(:each) do
    @advert = assign(:advert, Advert.create!(
                                title: "",
                                city: "MyString",
                                street: "MyString",
                                phone: "MyString"
    ))
  end

  it "renders the edit advert form" do
    render

    assert_select "form[action=?][method=?]", advert_path(@advert), "post" do
      assert_select "input[name=?]", "advert[title]"

      assert_select "input[name=?]", "advert[city]"

      assert_select "input[name=?]", "advert[street]"

      assert_select "input[name=?]", "advert[phone]"
    end
  end
end
