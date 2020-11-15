class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :shipped_prefecture_id, :town, :town_number, :building, :phone_number, :order, :user_id, :item_id, :token

  validates :token, presence: true

  # orderモデルのバリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
  end
  # /orderモデルのバリデーション

  # addressモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipped_prefecture_id, numericality: { other_than: 1 }
    validates :town, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :town_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid.' }
  end
  # /addressモデルのバリデーション

  def save
    # 購入の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, shipped_prefecture_id: shipped_prefecture_id, town: town, town_number: town_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
