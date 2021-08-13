class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all

  end

  #購入者のフルネームを作成
  def customer_full_name
    self.customer.last_name + self.customer.first_name
  end



end
