class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirm: 1, making: 2, preparing: 3, delivered: 4 }

    #注文個数を計算するメソッドを定義
  def item_total_count
    order_items.inject(0) do |result, n|
      result + n.amount
    end
  end

    #注文情報確認画面で表示するお届け先表示
  def address_display
    '〒' + postal_code + ' ' + address + '　' + name
  end


end
