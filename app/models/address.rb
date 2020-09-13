class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order
  with_options presence: true do
    validates :zip_code,format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :phone_number,unique:true,format: { with: /^\d{11}$/}
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id

end
