class Order < ApplicationRecord
  with_options presence: true do
    validates :user_id
    validates :item_id
  end
  belongs_to :user
  belongs_to :item
  # has_one :addresses
end