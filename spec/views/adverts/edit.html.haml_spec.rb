require "rails_helper"

RSpec.describe "adverts/edit" do
  it "renders the edit template" do
    assign(:advert, [FactoryGirl.create(:advert)])
    render

    expect(view).to render_template(:edit)
    expect(view).to render_template("edit")
    expect(view).to render_template("adverts/_form")
  end

  it "does not render a different template" do
    expect(view).to_not render_template("index")
  end
end
