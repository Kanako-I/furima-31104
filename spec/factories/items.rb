FactoryBot.define do
  factory :item do
    category_id           { 2 }
    item_condition_id     { 2 }
    shipped_prefecture_id { 2 }
    shipping_date_id      { 2 }
    shipping_fee_id       { 2 }
    title                 { 'タイトル' }
    description           { '説明' }
    price                 { 1000 }
  
    association :user
  end
end
 