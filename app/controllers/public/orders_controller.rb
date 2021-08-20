class Public::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @addresses = Address.where(customer_id: current_customer)
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)

    case params[:order][:address_type]

    when 'own'
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.full_name
    when 'selected'
      selected_address = Address.find(params[:order][:address_id])
      @order.address = selected_address.address
      @order.postal_code = selected_address.postal_code
      @order.name = selected_address.name
    end
    @cart_items = CartItem.where(customer_id: current_customer)
    @total_price = 0
    @order.shipping_cost = 800
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.item_id = cart_item.item_id
      order_item.order_id = @order.id
      order_item.price = cart_item.item.add_tax_price #消費税変更後も金額が変わらないように税込み価格で保存
      order_item.amount = cart_item.amount
      order_item.save
    end
    @cart_items.destroy_all

    redirect_to orders_complete_path
  end

  def index
    @orders = Order.where(customer_id: current_customer)
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :name,:address,:postal_code, :total_payment, :shipping_cost)
  end

end
