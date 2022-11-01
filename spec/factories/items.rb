FactoryBot.define do
  factory :item do
    item               { Faker::Lorem.characters(number: 40) }
    explanation        { Faker::Lorem.characters(number: 1000) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    condition_id       { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id   { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
