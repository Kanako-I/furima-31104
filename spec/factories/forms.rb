FactoryBot.define do
  factory :form do
    token                 { 'tok_abcdefghijk00000000000000000' }
    postal_code           { "100-1111" }
    shipped_prefecture_id { 2 }
    town                  { "渋谷" }
    building              { "" }
    town_number           { "2-23" }
    phone_number          { 11199999999 }

    item_id               { 1 }
    user_id               { 1 }

    # association :user
    # association :item
  end
end
