FactoryBot.define do
  factory :order_address do
    token          { 'tok_1234567890123456789012345678' }
    postal_code    { '000-0000' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { '市町村' }
    address        { '番地' }
    building_name  { '建物名' }
    phone_number   { '09012345678' }
  end
end