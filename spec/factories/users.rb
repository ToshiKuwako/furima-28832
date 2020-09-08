require 'faker'
FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            { "アあ亜" }
    family_name           { "アあ亜" }
    first_name_kana       { "フリガナ" }
    family_name_kana      { "フリガナ" }
    birth_date            { "2000/1/1"}
  end
end
