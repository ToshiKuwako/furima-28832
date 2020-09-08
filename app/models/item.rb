class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id,condition_id,postage_payer_id,prefecture_id,sending_time_id
  end
  
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :sending_time_id
  end

end
