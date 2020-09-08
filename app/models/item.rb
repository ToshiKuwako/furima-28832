class Item < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :description                
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :sending_time_id
    validates :price
end
