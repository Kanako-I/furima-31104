class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipped_prefecture
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :title
    validates :description
    validates :price
    validates :category_id
    validates :item_condition_id
    validates :shipping_fee_id
    validates :shipped_prefecture_id
    validates :shipping_date_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id  
    validates :shipping_fee_id
    validates :shipped_prefecture_id
    validates :shipping_date_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
