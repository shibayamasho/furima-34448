class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/}
    validates :order_id
  end

  belongs_to :order
end
