class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :tell, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :tell
    validates :token
  end
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end
  with_options format:{with:/\A\d{3}[-]\d{4}\z/} do
    validates :postal_code
  end
  with_options format:{with:/\A\d{10}$|^\d{11}\z/} do
    validates :tell
  end

  def save
    # クレジットカードの情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building , tell: tell, order_id: order.id)
  end

end