class Admin::OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)
    @order = Order.find(order_item.order_id)

    #製作ステータスが一つでも製作中＞注文ステータスが製作中に
    if OrderItem.where(order_id: @order.id, making_status: 'making').count >= 1
      if @order.status == 'confirm'
        @order.update(status: 'making')
      end
    end


    #製作ステータスがすべて製作完了＞注文ステータスが発送待ちに
    if @order.order_items.count == OrderItem.where(order_id: @order.id, making_status: 'complete').count
      if @order.status == 'making'
        @order.update(status: 'preparing')
      end
    end
    redirect_to admin_order_path(order_item.order_id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
