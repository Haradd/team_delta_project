require "rails_helper"

RSpec.describe Advert, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :street }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_uniqueness_of :phone }
  end

  describe "associations" do
    it { is_expected.to belong_to :user }
  end
end
