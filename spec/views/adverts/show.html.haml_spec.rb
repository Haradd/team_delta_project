require 'rails_helper'

RSpec.describe "adverts/show", type: :view do
  before(:each) do
    @advert = assign(:advert, Advert.create!(
      :title => "",
      :city => "City",
      :street => "Street",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Phone/)
  end
end
