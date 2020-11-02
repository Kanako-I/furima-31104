class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipped_prefecture
  belongs_to_active_hash :shipping_date

  validates :title, :description, :user, :price, :category_id, :item_condition_id, :shipping_fee_id, :shipped_prefecture_id, :shipping_date_id, presence: true
  validates :category_id, :item_condition_id, :shipping_fee_id, :shipped_prefecture_id, :shipping_date_id, numericality: { other_than: 1 } 
end
