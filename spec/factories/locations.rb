FactoryGirl.define do
  factory :location do
    association :advert, factory: :advert
    address "MyString"
    latitude 1.5
    longitude 1.5
  end
end
