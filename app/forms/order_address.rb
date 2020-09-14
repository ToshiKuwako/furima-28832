class OrderAddress
include ActiveModel::Model
   attr_accessor:zip_code,prefecture,city,house_number,building,phone_number

   with_options presence: true do
    validates :zip_code,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number,unique:true,format: { with: /^\d{11}$/}
  end
    validates :prefecture_id,numericality: { other_than: 1 } do
  end

  def save
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name)
    Order.create(user_id: user_id, item_id: item_id)
  end
end