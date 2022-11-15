FactoryBot.define do
  factory :buyer_shipping_address do
    first_code = Faker::Number.between(from: 100, to: 999)
    later_code = Faker::Number.between(from: 1000, to: 9999)
    first_code_s = first_code.to_s
    later_code_s = later_code.to_s

    postal_code   { first_code_s + '-' + later_code_s }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Gimei.city.kanji }
    address       { Faker::Lorem.characters }
    building_name { Faker::Lorem.characters }
    phone_number  { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
