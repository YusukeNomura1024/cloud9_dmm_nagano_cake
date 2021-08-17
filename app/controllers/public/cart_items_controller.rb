class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def delete_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    if cart_item = CartItem.find_by(item_id: cart_item_params[:item_id])
      amount = cart_item.amount.to_i + cart_item_params[:amount].to_i
      cart_item.update(amount: amount)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
      redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
