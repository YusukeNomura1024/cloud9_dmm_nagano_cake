class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all

  end

  #購入者のフルネームを作成
  def customer_full_name
    self.customer.last_name + self.customer.first_name
  end


  #注文個数を計算するメソッドを定義
  def item_total_count
    self.items.inject(0) do |result, n|
      result + n.amount
    end
  end
end
