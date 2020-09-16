class OrderAddress
include ActiveModel::Model
   attr_accessor :zip_code,:prefecture_id,:city,:house_number,
   :building,:phone_number,:token,:authenticity_token,:item_id,:user_id

   with_options presence: true do
    validates :zip_code,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :token
    validates :phone_number,format: { with: /\A\d{11}\z/}
  end
    validates :prefecture_id,numericality: { other_than: 1 } do
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
   
    Address.create(zip_code: zip_code,prefecture_id:prefecture_id, city: city, house_number: house_number, building: building,phone_number:phone_number,order_id:order.id)
    
  end
end