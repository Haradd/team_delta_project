require "rails_helper"

RSpec.describe "adverts/index", type: :view do
  before(:each) do
    assign(:adverts, [
             Advert.create!(
               title: "",
               city: "City",
               street: "Street",
               phone: "Phone"
             ),
             Advert.create!(
               title: "",
               city: "City",
               street: "Street",
               phone: "Phone"
             )
           ])
  end

  it "renders a list of adverts" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Street".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
  end
end
