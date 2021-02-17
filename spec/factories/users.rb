FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    last_name             {"鈴木"}
    first_name            {"一郎"}
    last_name_katakana    {"スズキ"}
    first_name_katakana   {"イチロー"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end