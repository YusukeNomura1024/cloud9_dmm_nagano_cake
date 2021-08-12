class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
  end

  def update
  end

  def destroy
  end

  def delete_all
  end

  def create
  end

end
