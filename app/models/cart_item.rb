class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  #小計の計算（税込）
  def subtotal
    amount * item.add_tax_price
  end

end
