## usersテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| encrypted_password   | string     | null: false                    |
| nickname             | string     | null: false, unique: true      |
| last_name_kanji      | string     | null: false                    |
| first_name_kanji     | string     | null: false                    | 
| last_name_katakana   | string     | null: false                    |
| first_name_katakana  | string     | null: false                    |
| date_of_birth        | date       | null: false                    |
| email                | string     | null: false, unique: true      |

### Association
has_many :items
has_many :order


##  itemsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ | 
| title                 | string     | null: false                    |
| description           | text       | null: false                    |
| user                  | references | null: false, foreign_key: true | 
| price                 | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| item_condition_id     | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| shipped_prefecture_id | integer    | null: false                    |
| shipping_date_id      | integer    | null: false                    |

### Association
belongs_to :user
has_one :order


## orderテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
belongs_to :item
has_one :address
belongs_to :user


## addressesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| town          | string     | null: false                    |
| town_number   | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
belongs_to :order
