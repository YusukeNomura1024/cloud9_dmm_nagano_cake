class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def active_for_authentication?
    super && (self.is_active == true)
  end

  def status_text
    if is_active
      "有効"
    else
      "退会済"
    end
  end

    #スタータスによるテキストのカラーコンテキストクラスの変更
  def status_color
    if is_active
      "text-success"
    else
      "text-secondary"
    end
  end


  # フルネームを作成します
  def full_name
    self.last_name + self.first_name
  end

end
