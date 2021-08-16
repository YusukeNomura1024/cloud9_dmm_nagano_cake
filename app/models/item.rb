class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  attachment :image

  def status_text
    if is_active
      "販売中"
    else
      "販売停止中"
    end
  end

  #スタータスによるクラスの変更
  def status_color
    if is_active
      "text-success"
    else
      "text-secondary"
    end
  end

 # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.08).round
  end

  def self.search(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"]).where(is_active: true)
  end


end
