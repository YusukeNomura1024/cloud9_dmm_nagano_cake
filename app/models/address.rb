class Address < ApplicationRecord
  belongs_to :customer

    #注文情報入力画面で表示するお届け先表示
  def address_display
    '〒' + postal_code + ' ' + address + '　' + name
  end

end
