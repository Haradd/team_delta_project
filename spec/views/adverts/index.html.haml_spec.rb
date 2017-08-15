require "rails_helper"

RSpec.describe "adverts/index", type: :view do
  before(:each) do
    assign(:adverts,
            [
             FactoryGirl.create(:advert),
             FactoryGirl.create(:Advert)
            ])
  end

  it "render new advert " do
    render @advert
    expect(rendered).to have_content 'title'
    expect(rendered).to have_content 'description'
    expect(rendered).to have_content 'phone'
    expect(rendered).to have_content 'city'
    expect(rendered).to have_content 'street'
  end
end
