class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sending_time
  belongs_to :user
  has_one :order
  has_one_attached :image
  validates :price ,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :sending_time_id
  end
end

