require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :street }
  end
end
