class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirm: 1, making: 2, preparing: 3, delivered: 4 }


end
