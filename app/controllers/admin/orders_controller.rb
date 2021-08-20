class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @total_price = 0
    @order.update(order_params)
    render :show
  end

  def index
     @orders = Order.where(customer_id: params[:id]).page(params[:page]).reverse_order
     @orders_title = Customer.find(params[:id]).full_name + 'さんの '
     render 'admin/homes/top'
  end

private

  def order_params
    params.require(:order).permit(:status)
  end

end
