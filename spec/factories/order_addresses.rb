FactoryBot.define do
  factory :order_address do
    token          { 'tok_0000000000000000000000000000' }
    postal_code    { '000-0000' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { '市町村' }
    address        { '番地' }
    building_name  { '建物名' }
    phone_number   { Faker::Number.between(from: 1000000000, to: 99999999999) }
    association :user
    association :item
  end
end
