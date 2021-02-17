class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase

  with_options presence: true do
    has_one_attached :image
    validates :item_name
    validates :item_text
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :days_to_ship_id
    validates :price
  end
end