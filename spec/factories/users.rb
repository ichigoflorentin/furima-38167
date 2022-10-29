FactoryBot.define do
  factory :user do

    japanese_user = Gimei.name

    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {japanese_user.first.kanji}
    last_name             {japanese_user.last.kanji}
    kana_first_name       {japanese_user.first.katakana}
    kana_last_name        {japanese_user.last.katakana}
    birthday              {Faker::Date.birthday(min_age: 0, max_age: 100)}
  end
end