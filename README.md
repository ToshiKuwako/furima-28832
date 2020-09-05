## users_テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| nickname          | string     | null: false, unique: true      |
| email             | string     | null: false, unique: true      |
| password          | string     | null: false, unique: true      |
| first_name        | string     | null: false                    |
| family_name       | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| family_name_kana  | string     | null: false                    |
| birth_date          | date       | null: false                    |

### Association
- belongs_to :item
- belongs_to :purchase

## items_テーブル

| Column                   | Type           | Options                       |
| ------------------------ | -------------- | ----------------------------- |
| user                     | references     | null: false                   |
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
- has_one :purchase


## category_テーブル(ActiveHash)

| Column   | Type       | Options        |
| ---------| ---------- | -------------- |
| category | string     | null: false    |


### Association
- has_many :items

## condition_テーブル(ActiveHash)

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| condition | string     | null: false                   |


### Association
- has_many :items

## postage_payer_テーブル(ActiveHash)

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postage_payer | string     | null: false                   |


### Association
- has_many :items

## sending＿time_テーブル(ActiveHash)

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| sending_time | string     | null: false                   |


### Association
- has_many :items

## prefecture_テーブル(ActiveHash)

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| prefecture   | string     | null: false                   |


### Association
- has_many :items
- has_many :addresses

## addresses_テーブル

| Column                   | Type           | Options                       |
| ------------------------ | -------------- | ----------------------------- |
| zip_code                 | string         | null: false                   |
| prefecture               | integer        | null: false,                  |
| city                     | string         | null: false                   |
| building                 | string         |                               |
| phone_number             | string         | null: false, unique: true     |
| purchase                 | references     | null: false, foreign_key: true|

### Association
- has_one :purchase

## purchase_テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| user      | references | null: false, foreign_key: true|
| item      | references | null: false, foreign_key: true|

### Association
- belongs_to :item
- has_one    :address
- belongs_to :user