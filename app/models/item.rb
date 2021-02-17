class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :days_to_ship

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
