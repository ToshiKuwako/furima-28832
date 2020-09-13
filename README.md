## users_テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| nickname          | string     | null: false,                   |
| email             | string     | null: false, unique: true      |
| password          | string     | null: false,                   |
| first_name        | string     | null: false                    |
| family_name       | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| family_name_kana  | string     | null: false                    |
| birth_date        | date       | null: false                    |

### Association
- has_many :items
- has_many :order

## items_テーブル

| Column                   | Type           | Options                       |
| ------------------------ | -------------- | ----------------------------- |
| user                     | references     | null: false,foreign_key:true  |
| name                     | string         | null: false                   |
| description              | text           | null: false                   |
| category_id              | integer        | null: false                   |
| condition_id             | integer        | null: false                   |
| postage_payer_id         | integer        | null: false                   |
| prefecture_id            | integer        | null: false                   |
| sending_time_id          | integer        | null: false                   |
| price                    | integer        | null: false                   |

### Association
- belongs_to :user
- has_one :order

## addresses_テーブル

| Column                   | Type           | Options                       |
| ------------------------ | -------------- | ----------------------------- |
| zip_code                 | string         | null: false                   |
| prefecture_id            | integer        | null: false,                  |
| city                     | string         | null: false                   |
| building                 | string         |                               |
| phone_number             | string         | null: false, unique: true     |
| orders                | references     | null: false, foreign_key: true|

### Association
- belongs_to :order

## orders_テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| user      | references | null: false, foreign_key: true|
| item      | references | null: false, foreign_key: true|

### Association
- belongs_to :item
- has_one    :address
- belongs_to :user