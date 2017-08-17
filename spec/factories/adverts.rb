FactoryGirl.define do
  factory :advert do
    association :user, factory: :user

    title { FFaker::Lorem.words.join(" ") }
    city { FFaker::Address.city }
    street { FFaker::Address.street_name }
    phone { FFaker::PhoneNumberAU.mobile_phone_number.gsub!(/\s/, "").slice(1..9) }
    description { FFaker::Lorem.sentence }
    price { rand(1..100) }
    job_type { %w[full_time part_time].sample }
    advert_type { %w[job care].sample }
  end
end
