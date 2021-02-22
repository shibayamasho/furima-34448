class Order < ApplicationRecord
  with_options presence: true do
    belongs_to :user
    belongs_to :item
    # has_one :addresses
  end
end