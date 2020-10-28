## usersテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| password             | string     | null: false                    |
| nickname             | string     | null: false, unique: true      |
| last_name(kanji)     | string     | null: false                    |
| first_name(kanji)    | string     | null: false                    | 
| last_name(katakana)  | string     | null: false                    |
| first_name(katakana) | string     | null: false                    |
| Date_of_Birth        | date       | null: false                    |

### Association
has_many :items
has_many :purchases
belong_to :address


##  itemsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| title                 | string     | null: false                    |
| description           | text       | null: false                    |
| posted.user_id        | references | null: false, foreign_key: true | 
| price                 | integer    | null: false                    |
| category_id           | text       | null: false                    |
| item condition        | text       | null: false                    |
| shipping.fee_id       | integer    | null: false                    |
| shipped.prefecture_id | text       | null: false                    |
| shipping.date_id      | date       | null: false                    |

### Association
belongs_to :user
has_one :purchase


## purchaseテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| purchased.user_id | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |
| date_of_purchase  | date       | null: false                    |

### Association
belongs_to :item
belongs_to :address
belongs_to :user


## addressテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | text       | null: false                    |
| town          | text       | null: false                    |

### Association
belongs_to :user
belongs_to :purchase
belongs_to :item
