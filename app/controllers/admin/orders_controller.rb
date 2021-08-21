class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @total_price = 0
    @order.update(order_params)
    #注文ステータスが入金確認＞製作ステータスがすべて製作待ちに
    if @order.status == 'confirm'
      @order.order_items.each do |order_item|
        if order_item.making_status == 'no_making'
          order_item.update(making_status: 'waiting')
        end
      end
    end
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
