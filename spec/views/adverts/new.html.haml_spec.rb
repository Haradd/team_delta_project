require "rails_helper"

RSpec.describe "adverts/new", type: :view do
  before(:each) do
    @advert = assign(:advert, FactoryGirl.create(:advert))
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
