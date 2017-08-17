FactoryGirl.define do
  factory :user do
    email    { FFaker::Internet.email }
    password { FFaker::Internet.password }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    phone { FFaker::PhoneNumberAU.mobile_phone_number.gsub!(/\s/, "").slice(1..9) }
    city { FFaker::Address.city }
    street { FFaker::Address.street_name }
  end
end
