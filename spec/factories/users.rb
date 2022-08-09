FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'鈴木'}
    first_name            {'太郎'}
    last_name_kana        {'スズキ'}
    first_name_kana       {'タロウ'}
    birthday              {'1989-01-01'}
  end
end