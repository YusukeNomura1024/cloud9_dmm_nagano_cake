class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy


  def is_active?
    if is_active
      "販売中"
    else
      "販売停止中"
    end
  end

  attachment :image
end
