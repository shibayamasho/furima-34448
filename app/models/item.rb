class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipment_source
  belongs_to :days_to_ship

  has_one_attached :image
  belongs_to :user
  # has_one :purchase

  with_options presence: true do
    validates :item_name
    validates :item_text
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :shipment_source_id
      validates :days_to_ship_id
    end

    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
