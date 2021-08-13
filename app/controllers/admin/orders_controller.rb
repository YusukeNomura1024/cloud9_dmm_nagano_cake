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

private

  def order_params
    params.require(:order).permit(:status)
  end

end
