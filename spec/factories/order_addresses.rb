FactoryBot.define do
  factory :order_address do
    #number         { '4242424242424242' }
    #exp_month      { '12' }
    #exp_year       { '25' }
    #cvc            { '123' }
    token          { 'tok_1234567890123456789012345678' }
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
