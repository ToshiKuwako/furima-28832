FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.nickname}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Japanese::Name.first_name}
    family_name           {Faker::Japanese::Name.family_name}
    first_name_kana       { "フリガナ" }
    family_name_kana      { "フリガナ" }
    birth_date            { 2000 }
  end
end
