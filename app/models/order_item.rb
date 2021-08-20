class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: { no_making: 0, waiting: 1, making: 2, complete: 3 }

   # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.08).round
  end


    #注文商品小計の計算
  def subtotal
    amount * price
  end

end
